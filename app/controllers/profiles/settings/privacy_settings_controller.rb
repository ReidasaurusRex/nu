class Profiles::Settings::PrivacySettingsController < Inheritance::ProfileMatchesUserController
  def update
    update_privacy_setting(privacy_setting_params)
  end

  private
  def privacy_setting_params

  end

  def update_privacy_setting(params)
    @privacy_setting = @profile.privacy_setting
    binding.pry
  end
end
