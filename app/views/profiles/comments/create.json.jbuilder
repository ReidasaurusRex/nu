json.comments @comments do |comment| 
    json.id comment.id
    json.newsfeed_item_id comment.newsfeed_item_id
    json.profile_id comment.profile_id
    json.profile_name comment.profile.full_or_abbrev_name
    json.profile_photo comment.profile.profile_photo
    json.text comment.text
    json.tsc comment.time_since_creation
  end