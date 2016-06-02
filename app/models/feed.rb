class Feed < ActiveRecord::Base
  has_many :entries, dependent: :destroy
  has_many :profile_feeds, dependent: :destroy
  has_many :profiles, through: :profile_feeds
end
