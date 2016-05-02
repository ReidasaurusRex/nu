module NavsHelper
  def proper_top_nav
    if session[:user_id] && User.find(session[:user_id]).profile
      render partial: "nav_bars/full_top_nav"
    else
      render partial: "nav_bars/shallow_top_nav"
    end
  end
end