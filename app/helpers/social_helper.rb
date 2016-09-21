module SocialHelper
  def subscription_link(user_profile, following_profile, profile_show=false)
    subscription_ids = user_profile.subscriptions.map {|subscrip| subscrip.following_id}
    if subscription_ids.include?(following_profile.id)
      subscription = user_profile.subscriptions.where(following_id: following_profile.id)[0]
      return link_to("Following", profile_subscription_path(profile_id: user_profile.id, id: subscription.id), method: :delete, class: "c-profile-summary__fol-link c-profile-summary__fol-link--unfollow", data: {confirm: "Unfollow #{following_profile.first_name}?"}).html_safe
    elsif user_profile.pending_followings.include?(following_profile)
      return "<span class='c-profile-summary__fol-link c-profile-summary__fol-link--unfollow'>Pending</span>".html_safe
    elsif user_profile == following_profile
      if profile_show
        return link_to("Edit Profile", edit_profile_path(user_profile), class: "c-profile-summary__fol-link c-profile-summary__fol-link--unfollow").html_safe
      else
        return link_to("View Profile", profile_path(user_profile), class: "c-profile-summary__fol-link c-profile-summary__fol-link--unfollow").html_safe
      end
    else
      return link_to("Follow", profile_pending_subscriptions_path(profile_id: user_profile.id, pending_subscription: {profile_id: user_profile.id, pending_following_id: following_profile.id}), method: :post, class: "c-profile-summary__fol-link c-profile-summary__fol-link--follow")
    end
  end

  def follow_link(user_profile, follower_profile, profile_show=false)
    follower_ids = user_profile.follows.pluck(:follower_id)
    if follower_ids.include?(follower_profile.id)
      follow = user_profile.follows.where(follower_id: follower_profile.id)[0]
      return link_to("Subscribed", profile_follow_path(profile_id: user_profile.id, id: follow), method: :delete, class: "c-profile-summary__fol-link c-profile-summary__fol-link--unfollow", data: {confirm: "Remove #{follower_profile.first_name}\'s subscription?"})
    elsif user_profile.pending_followers.include?(follower_profile)
      return link_to("Pending", profile_follow_paths(profile_id: user_profile.id, follow: {profile_id: user_profile.id, follower_id: follower_profile.id}), method: :post, class: "c-profile-summary__fol-link c-profile-summary__fol-link--unfollow")
    elsif user_profile == follower_profile
      if profile_show
        return link_to("Edit Profile", edit_profile_path(user_profile), class: "c-profile-summary__fol-link c-profile-summary__fol-link--unfollow").html_safe
      else
        return link_to("View Profile", profile_path(user_profile), class: "c-profile-summary__fol-link c-profile-summary__fol-link--unfollow").html_safe
      end
    end
      
  end
end