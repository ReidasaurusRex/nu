class Profiles::NotificationsController < Inheritance::CompletedProfileController
  def index
    @notifications = @profile.notifications.last(params[:num])
  end

  def destroy
    @notification = Notification.find(params[:id])
  end
end
