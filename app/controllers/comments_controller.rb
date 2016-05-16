class Profiles::CommentsController < Inheritance::CompletedProfileController
  before_action :get_newsfeed_item

  def create
    create_comment(comment_params)
  end

  def destroy
    destroy_comment
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(profile_id: @profile.id, newsfeed_item_id: @newsfeed_item.id)
  end

  def get_newsfeed_item
    @newsfeed_item = NewsfeedItem.find(params[:newsfeed_item_id])
  end

  def create_comment(params)
    @comment = Comment.new(params)
    binding.pry
    if @comment.save
      flash[:success] = "Commented!"
    else
      flash[:error] = "Couldn't comment"
    end
    redirect_to :back
  end

  def destroy_comment
    @comment = Comment.find(params[:id])
    binding.pry
    if @comment.profile = @profile
      @comment.destroy
      flash[:success] = "Removed comment"
    else
      flash[:error] = "Couldn't remove comment"
    end
    redirect_to :back
  end 

end
