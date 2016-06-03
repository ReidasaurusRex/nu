class Profiles::ProfileFeedsController < Inheritance::ProfileMatchesUserController
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
    binding.pry
  end

  private
  def profile_feed_params
    params.require(:profile_feed).permit(:profile_id, :feed_id)
  end

  def create_profile_feed(params)
    @profile_feed = ProfileFeed.new(params)
    if @profile_feed.save
      flash[:success] = "Added feed: #{@profile_feed.feed.name}"
      redirect_to profile_profile_feeds_path(@profile.id)
    else
      flash[:error] = "Something went wrong"
      render :index
    end
  end
end
