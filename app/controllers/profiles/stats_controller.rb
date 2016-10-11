class Profiles::StatsController < Inheritance::ProfileMatchesUserController
  def index
    @leaders_around_profile = leaders_around_profile(@profile.id, min_or_3)
    @highest_leader = @leaders_around_profile[0][:prof]
  end

  private
  def leaders_around_profile(profile_id, range, category=:total)
    leader_ids = PointOverview.order(category => :desc).pluck(:profile_id)
    index = leader_ids.index(profile_id)
    target_length = range * 2 + 1
    profiles_with_place = leader_ids.map.with_index do |id, ind|
      {place: ind + 1, prof: Profile.find(id)}
    end
    if index < range
      return profiles_with_place.slice(0, target_length)
    elsif index >= (leader_ids.length - range)
      return profiles_with_place.slice(-target_length, target_length)
    else
      return profiles_with_place[(index - range)..(index + range)]
    end
  end

  def min_or_3
    prof_length = Profile.count
    if prof_length > 7
      return 3
    else
      return prof_length / 2
    end
  end
end
