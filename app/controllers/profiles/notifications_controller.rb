class Profiles::NotificationsController < Inheritance::CompletedProfileController
  def index
    @notifications = @profile.notifications
  end

  def destroy
    @notification = Notification.find(params[:id])
  end
end
