class Profile < ActiveRecord::Base
  belongs_to :user

  # Social relations
  has_many :follows, dependent: :destroy
  has_many :followers, through: :follows
  has_many :pending_follows, dependent: :destroy
  has_many :pending_followers, through: :pending_follows
  has_many :subscriptions, dependent: :destroy
  has_many :followings, through: :subscriptions
  has_many :pending_subscriptions, dependent: :destroy
  has_many :pending_followings, through: :pending_subscriptions
  has_many :newsfeed_items, dependent: :destroy

  # Challenge relations
  has_many :profile_challenges, dependent: :destroy
  has_many :challenges, through: :profile_challenges

  # Setting relations
  has_one :privacy_setting, dependent: :destroy
  has_one :sharing_setting, dependent: :destroy

  # Misc relations
  has_many :footprints, dependent: :destroy
  has_many :blocked_users, dependent: :destroy
  has_many :notifications, dependent: :destroy

  
  @@state_list = %w(ak al ar az ca co ct dc de fl ga hi ia id il in ks ky la ma md me mi mn mo ms mt nc nd ne nh nj nm nv ny oh ok or pa ri sc sd tn tx ut va vt wa wi wv wy)
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

  def add_default_settings
    PrivacySetting.create(profile_id: self.id, display_location: "me", display_stats: "public", display_feed: "followers")
    SharingSetting.create(profile_id: self.id, improvements: true, follow: true, footprint: true)
  end

  def post_to_followers(header, content)
    self.followers.each do |follower|
      follower.newsfeed_items.create(source_id: self.id, header: header, content: content)
    end
  end

end
