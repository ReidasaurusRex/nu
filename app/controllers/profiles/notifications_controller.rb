class Profiles::NotificationsController < Inheritance::CompletedProfileController
  before_action :get_profile_from_profile_id
  def index
    @notifications = @profile.notifications
  end

  def destroy
    @notification = Notification.find(params[:id])
  end
end
