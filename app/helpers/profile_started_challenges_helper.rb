module ProfileStartedChallengesHelper
  def challenge_complete_or_check_in_link(psc)
    if psc.updateable?
      if psc.started_challenge_updates.length < psc.challenge.update_num - 1
        return  button_to("Check in", new_profile_started_challenge_started_challenge_update_path(psc.id), method: :get).html_safe
      else
        return  button_to("Complete", new_profile_started_challenge_profile_completed_challenge_path(profile_started_challenge_id: psc.id), method: :get).html_safe
      end
    else
      return "<span class='c-challenges-list__li__ext__upd-message'>#{psc.update_message}</span>".html_safe
    end
  end

  def challenge_progress_width(psc)
    return ((psc.started_challenge_updates.length.to_f / 4) * 100).to_i
  end

  def challenge_progress_point_mar_left(psc)
    update_num = psc.challenge.update_num
    return (100 / update_num - (update_num - 2)).to_i
  end

  def cond_point_filled_style(psc, updates, i)
    if psc.started_challenge_updates.length > i
      return "c-progress-challenge-bar__point--#{updates}-#{i+1}"
    end
  end

  def dots_for_progress_bar(psc)
    updates = psc.challenge.update_num - 1
    response_string = ""
    updates.times do |i|
      div = "<div class='c-progress-challenge-bar__point #{cond_point_filled_style(psc, updates, i)}' style='margin-left: #{challenge_progress_point_mar_left(psc)}%'></div>"
      response_string << div
    end
    return response_string.html_safe
  end
end