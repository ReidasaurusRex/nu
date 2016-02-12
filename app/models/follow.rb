class Follow < ActiveRecord::Base
  belongs_to :profile
  belongs_to :follower, class_name: "Profile"
end
