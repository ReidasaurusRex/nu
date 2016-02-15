class ProfileMatchesUser::PendingFollowsController < ProfileMatchesUserController
  before_action :get_pending_follows, only: :index

  def index
  end

  def create
  end

  def destroy
  end

  private
  def get_pending_followers
    @pending_followers = @profile.pending_followers
  end

  def add_pending_follow

  end
end