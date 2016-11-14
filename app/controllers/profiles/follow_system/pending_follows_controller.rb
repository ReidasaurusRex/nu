class Profiles::FollowSystem::PendingFollowsController < Inheritance::ProfileMatchesUserController
  def index
    @pending_follows = @profile.pending_follows
  end

  def create
  end

  def destroy
    destroy_pending_follow(params[:id])
  end

  private
  def pending_follow_params
    params.require(:pending_follow).permit(:profile_id, :pending_follower_id)
  end

  def destroy_pending_follow(id)
    @pending_follow = PendingFollow.find(id)
    @pending_subscription = @pending_follow.pending_follower.pending_subscriptions.where(pending_following_id: @profile.id)[0]
    @pending_follow.destroy
    @pending_subscription.destroy
  end
end