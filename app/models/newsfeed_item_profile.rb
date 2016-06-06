class NewsfeedItemProfile < ActiveRecord::Base
  belongs_to :newsfeed_item
  belongs_to :profile
end
