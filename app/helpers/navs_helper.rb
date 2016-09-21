module NavsHelper
  def proper_top_nav
    if session[:user_id] && User.find(session[:user_id]).profile
      render partial: "nav_bars/full_top_nav"
    else
      render partial: "nav_bars/shallow_top_nav"
    end
  end

  def pending_follows_color(user_profile)
    if user_profile.pending_follows.length > 0
      return "c-top-nav__nav-section__icon-link__noti-dot--apricot"
    end
  end
end