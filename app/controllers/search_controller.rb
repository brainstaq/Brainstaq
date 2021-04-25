class SearchController < ApplicationController
  def index
    if params[:query].blank?
      redirect_to root_path, alert: "Empty field!"
    elsif params[:query].start_with?('#')
      query  = params[:query].gsub('#', '')
      @ideas = Idea.joins(:idea).where(ideas: {title:    query})
      @users = User.joins(:user).where(users: {first_name:    query})
    else
      @ideas = Idea.where("title like ? or description like ?", "%#{params[:query]}%", "%#{params[:query]}%")
      @users = User.where("first_name like ? or last_name like ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end
  end

  def check_ideas_exists
    if Idea.exists?(:title => self.title)
    end
  end

  def check_users_exists
    if User.exists?(:first_name => self.first_name)
    elsif User.exists?(:last_name => self.last_name)
    end
  end

  # def search  
  #   if params[:search].blank?  
  #     redirect_to(root_path, alert: "Empty field!") and return  
  #   else
  #     @parameter = params[:search].downcase
  #     @ideas = Idea.where("lower(title) LIKE ?", "%#{@parameter}%")
  #     @users = User.all.where("lower(first_name) LIKE ?", "%#{@parameter}%")
  #   end  
  # end 

  # @results = Car.joins(:store).search(params[:search]).order("stores.name DESC")
  
end
 