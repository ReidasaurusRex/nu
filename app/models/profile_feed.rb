class ProfileFeed < ActiveRecord::Base
  belongs_to :profile
  belongs_to :feed

  validates :profile_id, numericality: {only_integer: true}
  validates :feed_id, numericality: {only_integer: true}
end
