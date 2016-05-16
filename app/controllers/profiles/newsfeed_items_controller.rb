class Profiles::NewsfeedItemsController < Inheritance::ProfileMatchesUserController
  before_action :get_newsfeed_item, except: [:index, :create]

  def index
    @newsfeed_items = @profile.newsfeed_items.order(updated_at: :desc)
    @newsfeed_item = NewsfeedItem.new
  end

  def create
    create_newsfeed_item(newsfeed_item_params)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def newsfeed_item_params
    params.require(:newsfeed_item).permit(:header, :content).merge(source_id: @profile.id)
  end

  def get_newsfeed_item
    @newsfeed_item = NewsfeedItem.find(params[:id])
  end

  def create_newsfeed_item(params)
    @newsfeed_item = NewsfeedItem.new(params)
    if @newsfeed_item.save
      NewsfeedItemProfile.create(profile_id: @profile.id, newsfeed_item_id: @newsfeed_item.id)
      @profile.followers.each{|follower| NewsfeedItemProfile.create(profile_id: follower.id, newsfeed_item_id: @newsfeed_item.id)}
      redirect_to profile_newsfeed_items_path(profile_id: @profile.id)
    else
      render :index
    end
  end
end
