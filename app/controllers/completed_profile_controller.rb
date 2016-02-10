class CompletedProfileController < LoggedInController
  before_action :ensure_completed_profile

  protected
  def ensure_completed_profile
    user = User.find(session[:user_id])
    unless user.profile
      redirect_to about_general_path
    end
  end

end