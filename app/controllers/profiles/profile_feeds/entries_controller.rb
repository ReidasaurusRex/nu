class Profiles::ProfileFeeds::EntriesController < Inheritance::ProfileMatchesUserController
  before_action :get_profile_feed

  def index
    @entries = @profile_feed.feed.entries.order(published: :desc)
  end

  def get_profile_feed
    @profile_feed = ProfileFeed.find(params[:profile_feed_id])
  end
end 