module ProfilesHelper
  def state_list
      [["AK", "ak"], ["AL", "al"], ["AR", "ar"], ["AZ", "az"], ["CA", "ca"], ["CO", "co"], ["CT", "ct"], ["DC", "dc"], ["DE", "de"], ["FL", "fl"], ["GA", "ga"], ["HI", "hi"], ["IA", "ia"], ["ID", "id"], ["IL", "il"], ["IN", "in"], ["KS", "ks"], ["KY", "ky"], ["LA", "la"], ["MA", "ma"], ["MD", "md"], ["ME", "me"], ["MI", "mi"], ["MN", "mn"], ["MO", "mo"], ["MS", "ms"], ["MT", "mt"], ["NC", "nc"], ["ND", "nd"], ["NE", "ne"], ["NH", "nh"], ["NJ", "nj"], ["NM", "nm"], ["NV", "nv"], ["NY", "ny"], ["OH", "oh"], ["OK", "ok"], ["OR", "or"], ["PA", "pa"], ["RI", "ri"], ["SC", "sc"], ["SD", "sd"], ["TN", "tn"], ["TX", "tx"], ["UT", "ut"], ["VA", "va"], ["VT", "vt"], ["WA", "wa"], ["WI", "wi"], ["WV", "wv"], ["WY", "wy"]]
  end

  def following_pending_or_not(user_profile, target_profile)
    if user_profile.followings.include?(target_profile)
      return "Following #{target_profile.first_name.capitalize}"
    elsif user_profile.pending_followings.include?(target_profile) 
      return "Pending following #{target_profile.first_name.capitalize}"
    else
        return "Not following #{target_profile.first_name.capitalize}"
    end
  end

  def following_me_pending_or_not(user_profile, target_profile)
    if target_profile.followings.include?(user_profile)
      return "Following you"
    elsif target_profile.pending_followings.include?(user_profile) 
      return "Pending following you"
    else
        return "Not following you"
    end
  end

  def following_me_pending_or_not_link(user_profile, target_profile)
    if user_profile.followers.include?(target_profile)
      return link_to("Remove follower", profile_follow_path(profile_id: user_profile.id, id: target_profile.id), method: :delete).html_safe
    elsif user_profile.pending_followers.include?(target_profile)
      return link_to("Add follower", profile_follows_path(profile_id: user_profile.id, follower_id: target_profile.id), method: :post).html_safe
    else
        return "..."
    end
  end

  def following_pending_or_not_link(user_profile, target_profile)
    if user_profile.followings.include?(target_profile)
      subscription_id = user_profile.subscriptions.select{|subscrip| subscrip.following_id == target_profile.id}[0]
      return link_to("Stop following", profile_subscription_path(profile_id: user_profile.id, id: subscription_id), method: :delete).html_safe
    elsif user_profile.pending_followings.include?(target_profile) 
      psubscription_id = user_profile.pending_subscriptions.select{|psubscrip| psubscrip.pending_following_id == target_profile.id}[0]
      return link_to("Rescind request", profile_pending_subscription_path(profile_id: user_profile.id, id: psubscription_id), method: :delete).html_safe
    else
      return link_to("Follow", profile_pending_subscriptions_path(profile_id: user_profile.id, pending_subscription: {profile_id: user_profile.id, pending_following_id: target_profile.id}), method: :post).html_safe
    end 
  end

  def edit_follow_unfollow_link(profile, user_profile)
    if profile == user_profile
      return link_to("Edit profile", edit_profile_path(user_profile))
    else
      following_pending_or_not_link(user_profile, profile)
    end
  end
end
