class ProfileFeed < ActiveRecord::Base
  belongs_to :profile
  belongs_to :feed
end
