module ProfileStartedChallengesHelper
  def challenge_complete_or_check_in_link(started_challenge)
    if started_challenge.started_challenge_updates.length < 4
      return  button_to("Check in", new_profile_started_challenge_started_challenge_update_path(started_challenge.id)).html_safe
    else
      return  button_to("Complete", new_profile_started_challenge_profile_completed_challenge_path(profile_started_challenge_id: started_challenge.id)).html_safe
    end
  end
end