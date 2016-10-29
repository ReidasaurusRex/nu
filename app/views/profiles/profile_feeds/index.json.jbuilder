json.current @profile_feeds do |cur_feed|
  json.id cur_feed.id
  json.feed_title cur_feed.feed.title
end

json.suggested @suggested_feeds do |sug_feed|
  json.id sug_feed.id
  json.title sug_feed.title
end