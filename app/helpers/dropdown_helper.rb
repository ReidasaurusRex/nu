module DropdownHelper
  def profile_or_user_summary(user)
    if user.profile
      render partial: "dropdown_menu/profile_summary", locals: {profile: user.profile}
    else
      render partial: "dropdown_menu/no_profile", locals: {user: user}
    end
  end
end