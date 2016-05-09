class Inheritance::CompletedProfileController < Inheritance::LoggedInController
  before_action :get_profile
  before_action :get_notifications

  protected
  # def ensure_completed_profile
  #   unless @user.profile
  #     flash[:error] = "Please complete your profile"
  #     redirect_to new_user_profile_path(@user)
  #   end
  # end

  def get_profile
    @profile = @user.profile
  end

  def get_notifications
    @notifications = @profile.notifications
  end

  def get_pending_follows
    @pending_follows = @profile.pending_follows
  end


end