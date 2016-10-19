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
  has_many :newsfeed_item_profiles, dependent: :destroy
  has_many :newsfeed_items, through: :newsfeed_item_profiles
  has_many :profile_feeds, dependent: :destroy
  has_many :feeds, through: :profile_feeds

  # Challenge relations
  has_many :profile_started_challenges, dependent: :destroy
  has_many :started_challenges, through: :profile_started_challenges, source: :challenge
  has_many :profile_completed_challenges, dependent: :destroy
  has_many :completed_challenges, through: :profile_completed_challenges, source: :challenge

  # Setting relations
  has_one :privacy_setting, dependent: :destroy
  has_one :notification_setting, dependent: :destroy

  # Misc relations
  has_many :footprints, dependent: :destroy
  has_many :profile_blocked_profiles, dependent: :destroy
  has_many :blocked_profiles, through: :profile_blocked_profiles
  has_many :notifications, dependent: :destroy
  has_one :point_overview, dependent: :destroy

  @@state_list = %w(ak al ar az ca co ct dc de fl ga hi ia id il in ks ky la ma md me mi mn mo ms mt nc nd ne nh nj nm nv ny oh ok or pa ri sc sd tn tx ut va vt wa wi wv wy)
  validates :first_name, presence: {message: " is required"}
  validates :last_name, presence: {message: " is required"}
  validates :state, inclusion: {in: @@state_list, 
    message: " choose an abbr"}
  validates :profile_photo, presence: {message: " is required"}
  validates :cover_photo, presence: {message: " is required"}

  after_create :add_default_settings
  after_create :add_point_overview
  after_create :add_default_feeds

  # Search settings
  fuzzily_searchable :full_name

  def full_name
    return "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end

  def full_name_changed? 
    # for fuzzy_search trigram updating
    first_name_changed? || last_name_changed?
  end

  def abbrev_name
    return "#{self.first_name.capitalize} #{self.last_name[0].upcase}."
  end

  def full_or_abbrev_name
    return self.full_name if self.privacy_setting.last_name
    return self.abbrev_name
  end

  def start_date
    return self.created_at.strftime("%B %Y")
  end

  def add_default_settings
    PrivacySetting.create(profile_id: self.id, location: "everyone", feed: "followers", last_name: true)
    NotificationSetting.create(profile_id: self.id, likes: true, comments: true, challenge_reminders: true, new_challenges: true)
  end

  def add_point_overview
    PointOverview.create(profile_id: self.id, total: 0, diet: 0, waste: 0, water: 0, transportation: 0, home_energy: 0, social: 0)
  end

  def add_default_feeds
    ProfileFeed.create(profile_id: self.id, feed_id: 2)
    ProfileFeed.create(profile_id: self.id, feed_id: 3)
    ProfileFeed.create(profile_id: self.id, feed_id: 4)
  end

  def post_to_followers(content)
    newsfeed_item = NewsfeedItem.create(source_type: "profile", source_id: self.id, content: content)
    self.newsfeed_item_profiles.create(newsfeed_item_id: newsfeed_item.id)
    self.followers.each do |follower|
      follower.newsfeed_item_profiles.create(newsfeed_item_id: newsfeed_item.id)
    end
  end

  def average_footprint_emissions
    finished_footprints = self.footprints.to_a.keep_if{|footprint| footprint.total_emissions} 
    unless finished_footprints.empty?
      emissions = finished_footprints.map{|footprint| footprint.total_emissions}
      return "#{(emissions.reduce(:+) / emissions.length)}lbs of CO2e"
    else
      return "Pending"
    end
  end

  def notify_followers(text, link)
    @profile.followers.each do |follower|
      follower.notifications.create(text: text, link: link)
    end
  end

  def current_place(category=:total)
    overviews = PointOverview.order(category => :desc)
    return overviews.index{|overview| overview.profile_id == self.id} + 1
  end

  def last_finished_footprint
    finished_footprints = self.footprints.select{|footprint| footprint.total_emissions}
    return finished_footprints.last unless finished_footprints.empty?
    return false
  end

  def footprint_overview_data
    overview_data = []
    self.footprints.order(:created_at).each do |footprint|
      overview_data.push([(footprint.created_at.to_f * 1000), footprint.total_emissions])
    end
    return overview_data
  end
end
