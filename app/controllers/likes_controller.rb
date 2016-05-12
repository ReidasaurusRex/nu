class Profiles::LikesController < Inheritance::CompletedProfileController
  before_action :get_newsfeed_item
  before_action :get_profile_from_user

  def index
    @likes = @newsfeed_item.likes
  end

  def create
    binding.pry
  end

  def destroy
    @like = Like.find(params[:id])
    binding.pry
  end

  private
  def get_newsfeed_item
    @newfeed_item = NewsfeedItem.find(params[:newsfeed_item_id])
  end

  def get_profile_from_user
    @profile = @user.profile
  end

  def create_like
    @like = @newsfeed_item.likes.build(profile_id: @profile.id)
    if @like.save
      flash[:success] = "Liked it!"
      redirect_to profile_newsfeed_items_path(profile_id: @profile.id)
    else
      flash[:error] = "Something went wrong"
      redirect_to profile_newsfeed_items_path(profile_id: @profile.id)
    end
  end
end
