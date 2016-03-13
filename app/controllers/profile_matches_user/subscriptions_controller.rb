class ProfileMatchesUser::SubscriptionsController < Inheritance::ProfileMatchesUserController
  # before_action :get_followers, only: :index

  def index
  end

  def create
    # create_follow
  end

  def destroy
    delete_subscription
  end

  private
  # def get_followers
  #   @followers = @profile.followers
  # end

  # def create_follow
  #   pending_follower_array = @profile.pending_follows.select{|pfollow| pfollow.pending_follower_id == params[:follower_id].to_i}

  #   unless pending_follower_array.empty?
  #     @profile.follows.create(follower_id: params[:follower_id])
  #     pending_follower_array.each{|pfollow| pfollow.destroy}
  #     flash[:success] = "Added follower!"
  #     redirect_to :back
  #   else
  #     flash[:error] = "Error adding follower"
  #     redirect_to :back
  #   end
  # end

  def delete_subscription
    @subscription = subscription.find(params[:id])
    if @profile.subscriptions.include?(@subscription)
      delete_subscription_follow
      @subscription.destroy
      flash[:success] = "Unfollowed #{@subscription.following.first_name}"
      redirect_to :back
    else
      flash[:error] = "Couldn't unfollow"
      redirect_to :back
    end
  end

  def delete_subscription_follow
    follow = @subscription.following.follows.find_by_follower_id(@profile.id)
    if follow
      follow.destroy
    else
      flash[:error] = "Couldn't unfollow"
      redirect_to :back
    end
  end
end