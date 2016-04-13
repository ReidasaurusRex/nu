class Profiles::Settings::GeneralSettingsController < Inheritance::ProfileMatchesUserController
  
  def index
    get_settings
  end

  private
  def get_settings
    @settings = Hash.new
    @settings[:sharing] = @profile.sharing_setting
    @settings[:privacy] = @profile.privacy_setting
    return @settings
  end
end
