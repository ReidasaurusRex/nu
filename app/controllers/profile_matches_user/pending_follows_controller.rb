class ProfileMatchesUser::PendingFollowsController < Inheritance::ProfileMatchesUserController
  def index
    @pending_follows = @profile.pending_follows
  end

  def create
  end

  def destroy
  end

  private
  def pending_follow_params
    params.require(:pending_follow).permit(:profile_id, :pending_follower_id)
  end

  def create_pending_follow(params)
    
  end
end