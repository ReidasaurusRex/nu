module LikesHelper
  def like_button(newsfeed_item)
    likes_profile_ids = newsfeed_item.likes.pluck(:profile_id)
    if likes_profile_ids.include?(newsfeed_item.profile.id)
      profile_like = newsfeed_item.likes.where(profile_id: newsfeed_item.profile.id)[0]
      return link_to("<i class='fa fa-thumbs-up liked'></i>".html_safe, newsfeed_item_like_path(newsfeed_item_id: newsfeed_item.id, id: profile_like.id), method: :delete)
    else
      return link_to("<i class='fa fa-thumbs-o-up'></i>".html_safe, newsfeed_item_likes_path(newsfeed_item_id: newsfeed_item.id), method: :post)
    end
  end

  def like_number(newsfeed_item)
    unless newsfeed_item.likes.empty?
      response = "#{newsfeed_item.likes.length} like"
      response << "s" if newsfeed_item.likes.length > 1
      return response
    else
      return ""
    end
  end
end 