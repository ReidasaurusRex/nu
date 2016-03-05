class ProfileMatchesUser::PendingSubscriptionsController < ProfileMatchesUserController
  def index
    @pending_subscriptions = @profile.pending_subscriptions
  end

  def create
    create_pending_subscription(pending_subscription_params)
  end

  def destroy
  end

  private
  def pending_subscription_params
    params.require(:pending_subscription).permit(:profile_id, :pending_following_id)
  end

  def create_pending_subscription(params)
    pending_subscrip = PendingSubscription.new(params)
    if pending_subscrip.save
      flash[:success] = "Sent following request"
      redirect_to profile_path(@profile)
    else
      flash[:error] = "Unable to request follow"
      redirect_to profile_path(@profile)
    end
  end
end