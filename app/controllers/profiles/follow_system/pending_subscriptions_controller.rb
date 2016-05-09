class Profiles::FollowSystem::PendingSubscriptionsController < Inheritance::ProfileMatchesUserController
  def index
    @pending_subscriptions = @profile.pending_subscriptions
  end

  def create
    create_pending_subscription(pending_subscription_params)
  end

  def destroy
    binding.pry
  end

  private
  def pending_subscription_params
    params.require(:pending_subscription).permit(:profile_id, :pending_following_id)
  end

  def create_pending_subscription(params)
    binding.pry 
    pending_subscrip = PendingSubscription.new(params)
    if pending_subscrip.save
      flash[:success] = "Sent following request"
      redirect_to profile_path(@profile)
    else
      flash[:error] = "Unable to request follow"
      redirect_to profile_path(@profile)
    end
  end

  def destroy_pending_subscription
    pfollowing = Profile.find(params)
  end
end