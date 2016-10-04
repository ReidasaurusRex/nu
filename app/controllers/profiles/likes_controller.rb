class Profiles::LikesController < Inheritance::CompletedProfileController
  before_action :get_newsfeed_item
  before_action :get_profile_from_user

  def index
    @likes = @newsfeed_item.likes
  end

  def create
    create_like
  end

  def destroy
    destroy_like
  end

  private
  def get_newsfeed_item
    @newsfeed_item = NewsfeedItem.find(params[:newsfeed_item_id])
  end

  def get_profile_from_user
    @profile = @user.profile
  end

  def create_like
    @like = @newsfeed_item.likes.build(profile_id: @profile.id)
    if @like.save
      flash[:success] = "Liked it!"
      unless @newsfeed_item.belongs_to_profile?(@profile)
        @newsfeed_item.source.notifications.create(link: "/profiles/#{@newsfeed_item.source.id}/newsfeed_items/#{@newsfeed_item.id}", text: "#{@profile.full_or_abbrev_name} liked your post", image: @profile.profile_photo)
      end
      redirect_to profile_newsfeed_items_path(profile_id: @profile.id)
    else
      flash[:error] = "Something went wrong"
      redirect_to profile_newsfeed_items_path(profile_id: @profile.id)
    end
  end

  def destroy_like
    @like = Like.find(params[:id])
    @like.destroy
    flash[:success] = "Unliked it!"
    redirect_to profile_newsfeed_items_path(profile_id: @profile.id)
  end
end
