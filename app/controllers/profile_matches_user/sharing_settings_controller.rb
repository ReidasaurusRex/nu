class ProfileMatchesUser::SharingSettingsController < Inheritance::ProfileMatchesUserController
  def edit
  end

  def update
  end

  private
  def sharing_setting_params
    params.require[:sharing_setting].permit(:improvements, :follow, :footprint).merge(profile_id: @profile.id)
  end
end
