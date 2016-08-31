module StatsHelper
  def leaderboards_around_profile(profile_id, range, category=:total)
    leader_ids = PointOverview.order(category => :desc).pluck(:profile_id)
    index = leader_ids.index(profile_id)
    target_length = range * 2 + 1
    if index < range
      return leader_ids.slice(0, target_length).map{|id| Profile.find(id)}
    elsif index >= (leader_ids.length - range)
      return leader_ids.slice(-target_length, target_length).map{|id| Profile.find(id)}
    else
      return leader_ids[(index - range)..(index + range)].map{|id| Profile.find(id)}
    end
  end

  def is_current_profile_leaderboard(profile_id, leaderboard_id)
    if profile_id == leaderboard_id
      return "current-profile-leaderboard"
    end
  end
end
