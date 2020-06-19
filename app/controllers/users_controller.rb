class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:profile, :index]


    def index
      @ideas = Idea.all.order(created_at: :desc)
      @users = User.find_by_username params[:username]
      @user = User.all
    end
    

    def create
      @users = User.create(params.require(:user))
      session[:user_id] = @user.id

      redirect_to :dashboard
    end

    def new
      @user = User.new
    end

    def profile
      @profile = User.find_by_username params[:username]
      @ideas = Idea.all.order(created_at: :desc)
      @ideas = current_user.ideas.order(created_at: :desc)
    end

    # def show
    #   @user = User.find_by_username params[:username]
    #   @ideas = Idea.all.order(created_at: :desc)
      
    # end


    def ideas
      @user = User.find(params[:id])
      @ideas = @user.ideas
    end
    
    # def show
    #   @ideas = Idea.all.order(created_at: :desc)
    #   @comment = Comment.new
    #   @user = User.find(params[:id])
      
    # end

    def set_user
      @user = User.find_by_username(params[:username])
    end

    def edit
     @user = User.find(params[:id]) 
    end

    def update
      current_user.update(params[:user])
      redirect_to dashboard_path(current_user)
    end

    private

    def user_params
      params.require(:user).permit(:id, :first_name, :last_name, :image, :image_url, :username, :country, :website, :phone, :gender, :bio, :email, :password, :password_confirmation)
    end

    def image_params
      params.require(:image).permit(:image_url)
    end
end
