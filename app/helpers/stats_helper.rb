module StatsHelper
  def recent_footprint_allotment_percentage(footprint)
    if footprint
      return footprint.percent_of_us_allotment
    else
      return 0
    end    
  end

  def is_current_profile_leader(profile_id, leaderboard_id)
    if profile_id == leaderboard_id
      return "u-profile-leader"
    end
  end

  def place_percentage_or_65(curr, highest)
    percent = (curr.point_overview.total.to_f / highest.point_overview.total.to_f) * 100
    if percent > 65
      return percent.to_i
    else
      return 65
    end
  end

  def progress_categories()
    return ["transportation", "home_energy", "water", "waste", "diet"]
  end

  def category_emissions_or_pending(footprint, category_emissions)
    if footprint
      if footprint[category_emissions]
        return footprint[category_emissions]
      else
        return "Pending"
      end
    else
      return "Pending"
    end
  end
end
