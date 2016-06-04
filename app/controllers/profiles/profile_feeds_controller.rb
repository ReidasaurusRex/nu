class Profiles::ProfileFeedsController < Inheritance::ProfileMatchesUserController
  before_action :get_profile_feed, only: [:show, :destroy]

  def index
    @profile_feeds = @profile.profile_feeds
    @suggested_feeds = Feed.suggested_feeds - @profile.feeds
  end

  def create
    create_profile_feed(profile_feed_params)
  end

  def show
  end

  def destroy
    @profile_feed.destroy
    flash[:success] = "Unfollowed feed"
    redirect_to profile_profile_feeds_path(profile_id: @profile.id)
  end

  private
  def get_profile_feed
    @profile_feed = ProfileFeed.find(params[:id])
  end
  def profile_feed_params
    params.require(:profile_feed).permit(:profile_id, :feed_id)
  end

  def create_profile_feed(params)
    @profile_feed = ProfileFeed.new(params)
    if @profile_feed.save
      add_recent_newsfeed_items_to_profile_feed(@profile_feed)
      flash[:success] = "Added feed: #{@profile_feed.feed.title}"
      redirect_to profile_profile_feeds_path(@profile.id)
    else
      flash[:error] = "Something went wrong"
      render :index
    end
  end

  def add_recent_newsfeed_items_to_profile_feed(profile_feed)
    recent_feed_items = NewsfeedItem.where("source_id = ? AND source_type = ?", profile_feed.feed_id, "feed").last(4)
    recent_feed_items.each do |feed_item|
      NewsfeedItemProfile.create(newsfeed_item_id: feed_item.id, profile_id: profile_feed.profile_id)
    end
    binding.pry
  end
end
