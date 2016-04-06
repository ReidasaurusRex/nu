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
  has_many :footprints, dependent: :destroy
  has_many :newsfeed_items, dependent: :destroy
  has_many :profile_habits, dependent: :destroy
  has_many :habits, through: :profile_habits
  has_many :profile_challenges, dependent: :destroy
  has_many :challenges, through: :profile_challenges
  has_many :blocked_users, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :user

  validates :first_name, presence: {message: " is required"}
  validates :last_name, presence: {message: " is required"}
  validates :state, inclusion: {in: @@state_list, 
    message: " choose an abbr"}

  def full_name 
    return "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end

  def start_date
    return self.created_at.strftime("%B, %Y")
  end
end
