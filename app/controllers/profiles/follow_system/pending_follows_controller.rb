class Profiles::FollowSystem::PendingFollowsController < Inheritance::ProfileMatchesUserController
  def index
    @pending_follows = @profile.pending_follows
  end

  def create
  end

  def destroy
    @pending_follow = PendingFollow.find(params[:id])
    @pending_follow.destroy
    redirect_to profile_path(@profile)
  end

  private
  def pending_follow_params
    params.require(:pending_follow).permit(:profile_id, :pending_follower_id)
  end
end