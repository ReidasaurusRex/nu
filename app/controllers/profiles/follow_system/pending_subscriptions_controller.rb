class Profiles::FollowSystem::PendingSubscriptionsController < Inheritance::ProfileMatchesUserController
  def index
    @pending_subscriptions = @profile.pending_subscriptions
  end

  def create
    create_pending_subscription(pending_subscription_params)
  end

  def destroy
    destroy_pending_subscription
  end

  private
  def pending_subscription_params
    params.require(:pending_subscription).permit(:profile_id, :pending_following_id)
  end

  def create_pending_subscription(params)
    @pending_subscription = PendingSubscription.new(params)
    if @pending_subscription.save
      pfollowing_profile = Profile.find(@pending_subscription.pending_following.id)
      pfollowing_profile.pending_follows.create(pending_follower_id: @profile.id)
      flash[:success] = "Sent following request"
      redirect_to profile_path(@profile)
    else
      flash[:error] = "Unable to request follow"
      redirect_to profile_path(@profile)
    end
  end

  def destroy_pending_subscription
    @pending_subscription = PendingSubscription.find(params[:id])
    pfollowing_profile = Profile.find(@pending_subscription.pending_following_id)
    if @pending_subscription.destroy
      pfollowing = pfollowing_profile.pending_follows.select{|pfol| pfol.pending_follower_id == @profile.id}[0]
      pfollowing.destroy
      flash[:success] = "Removed request"
      redirect_to root_path
    else
      flash[:error] = "Some shit went wrong"
      redirect_to root_path
    end
  end
end