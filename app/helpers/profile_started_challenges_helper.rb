module ProfileStartedChallengesHelper
  def challenge_complete_or_check_in_link(started_challenge)
    if started_challenge.updateable?
      if started_challenge.started_challenge_updates.length < started_challenge.challenge.update_num
        return  button_to("Check in", new_profile_started_challenge_started_challenge_update_path(started_challenge.id), method: :get).html_safe
      else
        return  button_to("Complete", new_profile_started_challenge_profile_completed_challenge_path(profile_started_challenge_id: started_challenge.id), method: :get).html_safe
      end
    else
      return "<span class='c-challenges-list__li__ext__upd-message'>#{started_challenge.update_message}</span>".html_safe
    end
  end

  def challenge_progress_width(started_challenge)
    return ((started_challenge.started_challenge_updates.length.to_f / 4) * 100).to_i
  end

  def challenge_progress_point_style(started_challenge, point_num)
    if started_challenge.started_challenge_updates.length >= point_num
      case point_num
      when 1
        return "c-progress-challenge-bar__point--1"
      when 2
        return "c-progress-challenge-bar__point--2"
      when 3
        return "c-progress-challenge-bar__point--3"
      else
        return ""
      end
    end
  end
end