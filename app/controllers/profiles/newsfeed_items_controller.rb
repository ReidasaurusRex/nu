class Profiles::NewsfeedItemsController < Inheritance::ProfileMatchesUserController
  before_action :get_newsfeed_item, except: [:index, :create]

  def index
    if params[:current_index]
      current_index = params[:current_index].to_i
      @next_newsfeed_items = @profile.newsfeed_items.order(updated_at: :desc).slice(current_index, 10)
    end
    @newsfeed_item = NewsfeedItem.new
    # TODO: style floats so odd item doesn't stack to bottom
  end

  def create
    create_newsfeed_item(newsfeed_item_params, tag_params)
  end

  def show
  end

  def edit
  end

  def update
    update_newsfeed_item(newsfeed_item_params)
  end

  def destroy
    @newsfeed_item.destroy
  end

  private
  def newsfeed_item_params
    params.require(:newsfeed_item).permit(:content).merge(source_id: @profile.id, source_type: "profile")
  end

  def tag_params
    params.fetch(:tags, {}).permit(:water, :waste, :energy, :social, :travel, :diet)
  end

  def get_newsfeed_item
    @newsfeed_item = NewsfeedItem.find(params[:id])
  end

  def create_newsfeed_item(params, tags)
    @newsfeed_item = NewsfeedItem.new(params)
    if @newsfeed_item.save
      @newsfeed_item.add_tags(tags)
      NewsfeedItemProfile.create(profile_id: @profile.id, newsfeed_item_id: @newsfeed_item.id)
      @profile.followers.each{|follower| NewsfeedItemProfile.create(profile_id: follower.id, newsfeed_item_id: @newsfeed_item.id)}
    else
      render :index
    end
  end

  def update_newsfeed_item(params)
    @newsfeed_item.update(params)
  end
end
