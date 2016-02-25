module SocialHelper
  def follow_link(user_profile, following_profile)
    subscription_ids = user_profile.subscriptions.map {|subscrip| subscrip.following_id}
    if subscription_ids.include?(following_profile.id)
      subscription = subscription_ids.select{|id| id == following_profile.id}[0]
      return link_to("Unfollow", profile_subscription_path(profile_id: user_profile.id, id: subscription), method: :delete)
    elsif user_profile.pending_followings.include?(following_profile)
      return "Pending following"
    else
      return link_to("Follow", profile_pending_subscriptions_path(profile_id: user_profile.id, pending_subscription: {profile_id: user_profile.id, pending_following_id: following_profile.id}), method: :post)
    end
  end

  def manage_subscription_link(user_profile, follower_profile)
    follower_ids = user_profile.follows.map {|follow| follow.follower_id}
    if follower_ids.include?(follower_profile.id)
      follow = follower_ids.select{|id| id == follower_profile.id}[0]
      return link_to("Remove from followers", profile_follow_path(profile_id: user_profile.id, id: follow), method: :delete)
    elsif user_profile.pending_followers.include?(follower_profile)
      return link_to("Permit to follow", profile_follow_paths(profile_id: user_profile.id, follow: {profile_id: user_profile.id, follower_id: follower_profile.id}), method: :post)
    end
      
  end
end