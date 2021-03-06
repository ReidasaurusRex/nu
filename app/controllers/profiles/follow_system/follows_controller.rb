class Profiles::FollowSystem::FollowsController < Inheritance::ProfileMatchesUserController
  before_action :get_followers, only: :index

  def index
  end

  def create
    create_follow
  end

  def destroy
    delete_follow
  end

  private
  def get_followers
    @followers = @profile.followers
  end

  def create_follow
    @pending_follow = @profile.pending_follows.select{|pfollow| pfollow.pending_follower_id == params[:follower_id].to_i}[0]
    if @pending_follow
      follower_profile = Profile.find(params[:follower_id])
      pending_subscription = follower_profile.pending_subscriptions.select{|psub| psub.pending_following_id == @profile.id}[0]
      follower_profile.subscriptions.create(following_id: @profile.id)
      @profile.follows.create(follower_id: params[:follower_id])
      @pending_follow.destroy
      pending_subscription.destroy
      flash[:success] = "Added follower!"
    else
      flash[:error] = "Error adding follower"
    end
  end

  def delete_follow
    @follow = Follow.find(params[:id])
    if @profile.follows.include?(@follow)
      delete_follower_subscription
      @follow.destroy
      flash[:success] = "Removed follower"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      redirect_to root_path
    end
  end

  def delete_follower_subscription
    subscription = @follow.follower.subscriptions.find_by_following_id(@profile.id)
    if subscription
      subscription.destroy
    else
      flash[:error] = "Couldn't remove follower"
      redirect_to :back
    end
  end
end