class ProfileMatchesUser::FollowsController < ProfileMatchesUserController
  before_action :get_followers, only: :index

  def index
  end

  def create
    create_follow
  end

  def destroy
  end

  private
  def get_followers
    @followers = @profile.followers
  end

  def create_follow
    pending_follower_array = @profile.pending_follows.select{|pfollow| pfollow.pending_follower_id == params[:follower_id].to_i}
    binding.pry
    unless pending_follower_array.empty?
      @profile.follows.create(follower_id: params[:follower_id])
      pending_follower_array.each{|pfollow| pfollow.destroy}
      flash[:success] = "Added follower!"
      redirect_to :back
    else
      flash[:error] = "Error adding follower"
      redirect_to :back
    end
  end
end