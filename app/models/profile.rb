class Profile < ActiveRecord::Base
  has_many :followers
  has_many :pending_followers
  has_many :followings
  has_many :pending_followings
  has_many :emissions_profiles
  has_many :newsfeed_items
  has_many :posts
  has_many :started_habits
  has_many :completed_habits
  has_many :started_challenges
  has_many :completed_challenges
  has_many :blocked_users
  has_many :notifications
end
