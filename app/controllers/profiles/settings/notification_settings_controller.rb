class Profiles::Settings::NotificationSettingsController < Inheritance::ProfileMatchesUserController
  def update
    update_notification_setting(notification_setting_params)
  end

  private
  def notification_setting_params
    params.require(:notification_setting).permit(:location, :feed, :last_name)
  end

  def update_notification_setting(params)
    @notification_setting = @profile.notification_setting
    @notification_setting.update(params)
    redirect_to profile_general_settings_path(@profile)
  end
end