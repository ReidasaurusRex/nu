json.notifications @notifications do |notification|
  json.id notification.id
  json.unseen notification.unseen
  json.image notification.image
  json.text notification.text
  json.link notification.link
  json.profileID notification.profile_id
end