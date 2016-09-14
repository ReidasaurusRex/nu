class Comment < ActiveRecord::Base
  # TODO: rename comments to replies
  belongs_to :newsfeed_item
  belongs_to :profile
end
