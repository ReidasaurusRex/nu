class PendingFollow < ActiveRecord::Base
  belongs_to :profile
  belongs_to :pending_follower, class_name: "Profile"
end
