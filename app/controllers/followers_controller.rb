class FollowersController < ApplicationController

  def random
    render json: User.who_to_follow(current_user.id)
  end

  def create
  	if already_followed?
      flash[:notice] = "You already followed!"
    else
      follower = Follower.create(user_id: params[:id], followed_by: current_user.id)
      flash[:notice] = "Following Successfully!"
      redirect_to root_path
    end
  end

  def destroy
  	if !already_followed?
  		flash[:notice] = "Can't unfollow!"
  	else
  		current_user.followers.where(user_id: params[:id]).destroy_all
  		flash[:notice] = "Unfollowing Successfully!"
  		redirect_to root_path
  	end
  end

  private
  def already_followed?
    Follower.where(followed_by: current_user.id, user_id: params[:id]).exists?
  end

end
