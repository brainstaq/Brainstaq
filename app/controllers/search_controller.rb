class SearchController < ApplicationController
  def index
    if params[:query].blank?
      redirect_to root_path, alert: "Empty field!"
    elsif params[:query].start_with?('#')
      query  = params[:query].gsub('#', '')
      @ideas = Idea.joins(:idea).where(ideas: {title:    query})
      @enterprises = Enterprise.joins(:enterprise).where(enterprises: {name:    query})
      @users = User.joins(:user).where(users: {first_name:    query})
    else
      @ideas = Idea.where("title like ? or description like ?", "%#{params[:query]}%", "%#{params[:query]}%")
      @enterprises = Enterprise.where("name like ? or info like ?", "%#{params[:query]}%", "%#{params[:query]}%")
      @users = User.where("first_name like ? or last_name like ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end
  end

  def check_ideas_exists
    if Idea.exists?(:title => self.title)
    end
  end

  def check_enterprises_exists
    if Enterprise.exists?(:name => self.name)
    end
  end

  def check_users_exists
    if User.exists?(:first_name => self.first_name)
    elsif User.exists?(:last_name => self.last_name)
    end
  end
  
end
 