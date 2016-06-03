class Profiles::FeedsController < Inheritance::ProfileMatchesUserController
  def create
    begin
      url = new_feed_url
      potential_new_feed = Feedjira::Feed.fetch_and_parse(url)
      if !Feed.pluck(:url).include?(potential_new_feed.url)
        new_feed = Feed.create_from_feedjira_feed(url, potential_new_feed)
        ProfileFeed.create(feed_id: new_feed.id, profile_id: @profile.id)
        flash[:success] = "Added a new feed: #{new_feed.name}"
        redirect_to profile_profile_feeds_path(@profile)
      elsif !@profile.feeds.map{|feed| feed.url}.include?(potential_new_feed.url)
        feed_to_follow = Feed.find_by url: potential_new_feed.url
        ProfileFeed.create(profile_id: @profile.id, feed_id: feed_to_follow.id)
        flash[:success] = "Added a new feed: #{feed_to_follow.name}"
        redirect_to profile_profile_feeds_path(@profile)
      else
        flash[:error] = "Looks like you\'re already following that feed"
        redirect_to profile_profile_feeds_path(@profile)
      end
    rescue
      flash[:error] = "Couldn\'t find feed with url #{url}"
      redirect_to profile_profile_feeds_path(@profile)
    end
  end

  private
  def new_feed_url
    params.require(:feed).permit(:url)[:url]
  end
end