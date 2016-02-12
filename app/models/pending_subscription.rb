class PendingSubscription < ActiveRecord::Base
  belongs_to :profile
  belongs_to :pending_following, class_name: "Profile"
end
