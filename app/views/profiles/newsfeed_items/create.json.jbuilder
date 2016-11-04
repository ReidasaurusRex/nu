json.newsfeed_item do 
  json.id @newsfeed_item.id
  json.content @newsfeed_item.content
  json.image @newsfeed_item.image
  json.source_type @newsfeed_item.source_type
  json.source_id @newsfeed_item.source_id
  json.source_name @newsfeed_item.source_name_or_title(@profile)
  json.feed @newsfeed_item.feed_or_nil
  json.url @newsfeed_item.url_or_nil
  json.tsc @newsfeed_item.time_since_creation
  json.likes @newsfeed_item.likes
  json.tags @newsfeed_item.tags
  json.comments @newsfeed_item.comments do |comment| 
    json.id comment.id
    json.newsfeed_item_id comment.newsfeed_item_id
    json.profile_id comment.profile_id
    json.profile_name comment.profile.full_or_abbrev_name
    json.profile_photo comment.profile.profile_photo
    json.text comment.text
    json.tsc comment.time_since_creation
  end

end
