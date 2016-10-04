class Profiles::Settings::PrivacySettingsController < Inheritance::ProfileMatchesUserController
  def update
    update_privacy_setting(privacy_setting_params)
  end

  private
  def privacy_setting_params
    params.require(:privacy_setting).permit(:location, :feed, :last_name)
  end

  def update_privacy_setting(params)
    @privacy_setting = @profile.privacy_setting
    @privacy_setting.update(params)
    redirect_to profile_general_settings_path(@profile)
  end
end
