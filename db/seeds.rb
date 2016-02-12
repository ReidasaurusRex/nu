# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jarrell = User.create(email: "jarrell@nu.world", password: "1234")
kendra = User.create(email: "kendra@nu.world", password: "1234")
steven = User.create(email: "steven@nu.world", password: "1234")
reid = User.create(email: "reid@nu.world", password: "1234")

jprof = Profile.create(user_id: jarrell.id, first_name: "Jarrell", last_name: "Whipple", state: "ut", interests: "Saving the planet")
kprof = Profile.create(user_id: kendra.id, first_name: "Kendra", last_name: "Black", state: "ut", interests: "Saving the planet")
sprof = Profile.create(user_id: steven.id, first_name: "Steven", last_name: "Nagie", state: "ut", interests: "Saving the planet")
rprof = Profile.create(user_id: reid.id, first_name: "Reid", last_name: "Lewis", state: "az", interests: "Saving the planet. And riding my bike")

jprof.follows.create(follower_id: kprof.id)
jprof.follows.create(follower_id: sprof.id)
jprof.pending_follows.create(pending_follower_id: rprof.id)

jprof.subscriptions.create(following_id: sprof.id)
jprof.pending_subscriptions.create(pending_following_id: kprof.id)

kprof.follows.create(follower_id: rprof.id)
kprof.follows.create(follower_id: sprof.id)
kprof.pending_follows.create(pending_follower_id: jprof.id)

kprof.subscriptions.create(following_id: jprof.id)
kprof.subscriptions.create(following_id: sprof.id)

sprof.follows.create(follower_id: kprof.id)
sprof.pending_follows.create(pending_follower_id: rprof.id)

sprof.subscriptions.create(following_id: jprof.id)
sprof.subscriptions.create(following_id: kprof.id)
sprof.pending_subscriptions.create(pending_following_id: rprof.id)

rprof.pending_follows.create(pending_follower_id: sprof.id)

rprof.subscriptions.create(following_id: kprof.id)
rprof.pending_subscriptions.create(pending_following_id: jprof.id)
