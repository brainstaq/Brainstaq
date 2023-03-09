# class FollowsController < ApplicationController
#   def following
#     @title = "Following"
#     @user = User.find(params[:id])
#     @users = @user.followed_users
#     render 'followings'
#   end

#   def follower
#     @title = "Followers"
#     @user = User.find(params[:id])
#     @users = @user.followees
#     render 'followers'
#   end
# end


class FollowsController < ApplicationController
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.map(&:followee_username)
    render 'followings'
  end

  def follower
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followees.map(&:follower_username)
    render 'followers'
  end
end
