class Profiles::NewsfeedItemsController < Inheritance::ProfileMatchesUserController
  before_action :get_newsfeed_item, except: [:index, :create]

  def index
    current_index = params[:current_index].to_i if params[:current_index]
    next_newsfeed_items = @profile.newsfeed_items.order(updated_at: :desc).slice(current_index, 10) if current_index
    @next_items_with_additional_info = next_newsfeed_items.map do |item|
      {
        id: item.id,
        content: item.content,
        image: item.image,
        source_type: item.source_type,
        source_id: item.source_id,
        title: item.source_name_or_title,
        url: item.url_or_nil
      }
    end
    @newsfeed_item = NewsfeedItem.new
    # TODO: style floats so odd item doesn't stack to bottom
    respond_to do |format|
      format.html
      format.json {render json: @next_items_with_additional_info}
    end
  end

  def create
    create_newsfeed_item(newsfeed_item_params, tag_params)
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
      redirect_to profile_newsfeed_items_path(profile_id: @profile.id)
    else
      render :index
    end
  end
end
