class Subscription < ActiveRecord::Base
  belongs_to :profile
  belongs_to :following, class_name: "Profile"
end
