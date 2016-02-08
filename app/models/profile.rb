class Profile < ActiveRecord::Base
  has_many :followers, dependent: :destroy
  has_many :pending_followers, dependent: :destroy
  has_many :followings, dependent: :destroy
  has_many :pending_followings, dependent: :destroy
  has_many :emissions_profiles, dependent: :destroy
  has_many :newsfeed_items, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :started_habits, dependent: :destroy
  has_many :completed_habits, dependent: :destroy
  has_many :started_challenges, dependent: :destroy
  has_many :completed_challenges, dependent: :destroy
  has_many :blocked_users, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :user
end
