module ProfileStartedChallengesHelper
  def challenge_complete_or_check_in_link(started_challenge)
    if started_challenge.started_challenge_updates.length < 4
      return  button_to("Check in", new_profile_started_challenge_started_challenge_update_path(started_challenge.id), method: :get).html_safe
    else
      return  button_to("Complete", new_profile_started_challenge_profile_completed_challenge_path(profile_started_challenge_id: started_challenge.id), method: :get).html_safe
    end
  end

  def challenge_progress_width(started_challenge)
    return ((started_challenge.started_challenge_updates.length.to_f / 4) * 100).to_i
  end
end