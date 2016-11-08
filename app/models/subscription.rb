class Subscription < ActiveRecord::Base
  belongs_to :profile
  belongs_to :following, class_name: "Profile"

  def self.subscription_for_profile(profile, following_id)
    subscription_ids = profile.subscriptions.pluck(:following_id)
    if subscription_ids.include?(following_id.to_i)
      return profile.subscriptions.where(following_id: following_id)[0]
    else
      raise 'Subscription not found'
    end
  end
end
