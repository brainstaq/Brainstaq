class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  def create
    @idea = Idea.find(params[:idea_id]) #finds the idea with the associated idea_id
    @comment = @idea.comments.create(comment_params) # creates the comment on the idea passing in params
    @comment.user_id = current_user.id if current_user #assigns logged in user's ID to comment
    @comment.save!

    redirect_to idea_path(@comment.idea), notice: "Your comment was successfully posted."

  end

  def destroy
  	@idea = Idea.find(params[:idea_id])
  	@comment = @idea.comments.find(params[:id])
  	@comment.destroy
  	redirect_to idea_path(@idea)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:username, :body, :idea_id)
    end
end
