class BlockedUser < ActiveRecord::Base
  belongs_to :profile
  belongs_to :blocked_profile, class_name: "Profile"
end
