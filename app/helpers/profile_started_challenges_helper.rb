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

  def challenge_progress_point_mar_left(started_challenge)
    update_num = started_challenge.challenge.update_num
    return (100 / update_num - (update_num - 2)).to_i
  end

  def dots_for_progress_bar(psc)
    updates = psc.challenge.update_num - 1
    response_string = ""
    updates.times do |i|
      div = "<div class='c-progress-challenge-bar__point c-progress-challenge-bar__point--#{updates}-#{i+1}' style='margin-left: #{challenge_progress_point_mar_left(psc)}%'></div>"
      response_string << div
    end
    return response_string.html_safe
  end
end