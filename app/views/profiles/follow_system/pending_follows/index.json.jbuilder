json.pending_follows @pending_follows do |pf|
  json.id pf.id
  json.follower_name pf.pending_follower.full_or_abbrev_name
  json.follower_pic pf.pending_follower.profile_photo
  json.follower_id pf.pending_follower_id
end