class Profiles::Settings::NotificationSettingsController < Inheritance::ProfileMatchesUserController
  def update
    update_notification_setting(notification_setting_params)
  end

  private
  def notification_setting_params
    binding.pry
    params.fetch(:notification_setting, {}).permit(:likes, :comments, :challenge_reminders, :new_challenges)
  end

  def update_notification_setting(params)
    @notification_setting = @profile.notification_setting
    @notification_setting.update(params)
    binding.pry
    redirect_to profile_general_settings_path(@profile)
  end
end