class ProfileMatchesUser::NewsfeedItemsController < Inheritance::ProfileMatchesUserController
  before_action :get_profile_from_profile_id
  def index
    @newsfeed_items = @profile.newsfeed_items
  end

  def show
  end
end
