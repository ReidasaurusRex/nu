class Profiles::FeedsController < Inheritance::ProfileMatchesUserController
  def create
    begin
      url = params[:feed_url]
      potential_new_feed = Feedjira::Feed.fetch_and_parse(url)
        if !Feed.pluck(:url).include?(url)
          new_feed = Feed.create_from_parse(potential_new_feed)
          ProfileFeed.create(feed_id: new_feed.id, profile_id: @profile.id)
          flash[:success] = "Added a new feed!"
          redirect_to profile_profile_feeds_path(@profile)
        else
          flash[:error] = "Something went wrong"
          redirect_to profile_profile_feeds_path(@profile)
        end
    rescue
      flash[:error] = "Something went wrong"
      redirect_to profile_profile_feeds_path(@profile)
    end
  end
end