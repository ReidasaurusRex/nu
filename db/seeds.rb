jarrell = User.create(email: "jarrell@nu.world", password: "1234")
kendra = User.create(email: "kendra@nu.world", password: "1234")
steven = User.create(email: "steven@nu.world", password: "1234")
reid = User.create(email: "reid@nu.world", password: "1234")

jprof = Profile.create(user_id: jarrell.id, first_name: "Jarrell", last_name: "Whipple", state: "ut", interests: "Saving the planet")
kprof = Profile.create(user_id: kendra.id, first_name: "Kendra", last_name: "Black", state: "ut", interests: "Saving the planet")
sprof = Profile.create(user_id: steven.id, first_name: "Steven", last_name: "Nagie", state: "ut", interests: "Saving the planet")
rprof = Profile.create(user_id: reid.id, first_name: "Reid", last_name: "Lewis", state: "az", interests: "Saving the planet. And riding my bike")

profiles = [jprof, kprof, sprof, rprof]
profiles.each{|prof| prof.add_default_settings}

jprof.follows.create(follower_id: kprof.id)
jprof.follows.create(follower_id: sprof.id)
jprof.pending_follows.create(pending_follower_id: rprof.id)

jprof.subscriptions.create(following_id: sprof.id)
jprof.subscriptions.create(following_id: rprof.id)
jprof.pending_subscriptions.create(pending_following_id: kprof.id)

kprof.follows.create(follower_id: rprof.id)
kprof.follows.create(follower_id: sprof.id)
kprof.pending_follows.create(pending_follower_id: jprof.id)

kprof.subscriptions.create(following_id: jprof.id)
kprof.subscriptions.create(following_id: sprof.id)
kprof.subscriptions.create(following_id: rprof.id)

sprof.follows.create(follower_id: kprof.id)
sprof.pending_follows.create(pending_follower_id: rprof.id)

sprof.subscriptions.create(following_id: jprof.id)
sprof.subscriptions.create(following_id: kprof.id)
sprof.subscriptions.create(following_id: rprof.id)

rprof.follows.create(follower_id: jprof.id)
rprof.follows.create(follower_id: kprof.id)
rprof.follows.create(follower_id: sprof.id)

rprof.subscriptions.create(following_id: kprof.id)
rprof.pending_subscriptions.create(pending_following_id: jprof.id)

habits = Habit.create([
  {title: "Cold Showerer", caption: "Shower smart. Save energy and invigorate your skin by showering with cold water", description: "Showering with cold water can save you some shit", points: 25, progress_category: "Home Energy"}, 
  {title: "Cyclist", caption: "Screw your car", description: "By biking everywhere, you can be a boss", points: 40, progress_category: "Transportation"}, 
  {title: "Produce purchaser", caption: "Buy produce at the store to reduce packaging", description: "You can reduce your trash by a metric fuck ton if you opt for produce over preprocessed foods", points: 20, progress_category: "Diet"}, 
  {title: "Line Dryer", caption: "Hang clothes on the line to dry. Save energy", description: "Utilizing a clothes line to dry your laundry can save you x, y, and even Z amount of energy", points: 23, progress_category: "Home Energy"}, 
  {title: "Meatless weekdays", caption: "Cut meat out of your diet except for the weekend", description: "Only eating meat on the weekend can reduce the diet portion of your carbon footprint by 40%", points: 35, progress_category: "Diet"}
  ])

rprof.profile_habits.create(habit_id: habits[0].id, completed: true)
rprof.profile_habits.create(habit_id: habits[1].id, completed: true)