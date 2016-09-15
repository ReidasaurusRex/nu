module SocialOverviewHelper
  # TODO: Rename likes to appreciations
  def like_button(newsfeed_item, profile)
    likes_profile_ids = newsfeed_item.likes.pluck(:profile_id)
    if likes_profile_ids.include?(profile.id)
      profile_like = newsfeed_item.likes.where(profile_id: profile.id)[0]
      return link_to("<i class='fa fa-heart u-text--apricot'></i>".html_safe, newsfeed_item_like_path(newsfeed_item_id: newsfeed_item.id, id: profile_like.id), method: :delete, title: "Unappreciate")
    else
      return link_to("<i class='fa fa-heart u-text--silver-sand'></i>".html_safe, newsfeed_item_likes_path(newsfeed_item_id: newsfeed_item.id), method: :post, title: "Appreciate")
    end
  end

  def like_number(newsfeed_item)
    unless newsfeed_item.likes.empty?
      return newsfeed_item.likes.length
    else
      return ""
    end
  end

  def comment_button(newsfeed_item, profile)
    comments_profile_ids = newsfeed_item.comments.pluck(:profile_id)
    if comments_profile_ids.include?(profile.id)
      return "<i class='fa fa-reply u-text--monte-carlo'></i>".html_safe
    else
      return "<i class='fa fa-reply u-text--silver-sand'></i>".html_safe
    end
  end

  def comment_number(newsfeed_item)
    unless newsfeed_item.comments.empty?
      return newsfeed_item.comments.length
    else
      return ""
    end
  end
end 