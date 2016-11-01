json.items @next_newsfeed_items do |item|
  json.id item.id
  json.content item.content
  json.image item.image
  json.source_type item.source_type
  json.source_id item.source_id
  json.source_name item.source_name_or_title(@profile)
  json.feed item.feed_or_nil
  json.url item.url_or_nil
  json.tsc item.time_since_creation
  json.likes item.likes
  json.comments item.comments do |comment| 
    json.id comment.id
    json.newsfeed_item_id comment.newsfeed_item_id
    json.profile_id comment.profile_id
    json.profile_photo comment.profile.profile_photo
    json.text comment.text
  end
end