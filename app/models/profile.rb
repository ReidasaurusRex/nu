class Profile < ActiveRecord::Base
  @@state_list = %w(ak al ar az ca co ct dc de fl ga hi ia id il in ks ky la ma md me mi mn mo ms mt nc nd ne nh nj nm nv ny oh ok or pa ri sc sd tn tx ut va vt wa wi wv wy)

  has_many :follows
  has_many :followers, through: :follows, dependent: :destroy
  has_many :pending_follows
  has_many :pending_followers, through: :pending_follows, dependent: :destroy
  has_many :subscriptions
  has_many :followings, through: :subscriptions, dependent: :destroy
  has_many :pending_subscriptions
  has_many :pending_followings, through: :pending_subscriptions, dependent: :destroy
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

  validates :first_name, presence: {message: " is required"}
  validates :last_name, presence: {message: " is required"}
  validates :state, inclusion: {in: @@state_list, 
    message: " choose an abbr"}
end
