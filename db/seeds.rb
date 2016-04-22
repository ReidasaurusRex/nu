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

challenges = Challenge.create([
  {title: "Water Ghost", caption: "Use as little water as possible for a week", description: "You need about 2.5 liters of water a day to stay healthy. How close can you get your total daily water use to that number? Cut down on shower times (or showers, eek!), hand washing times, dishwashing water, and everything else to cut down your water usage for a week.", points: 25, progress_category: "Water"}, 
  {title: "Natural Transporter", caption: "Screw your car. Use your legs for a week", description: "How little can you use your car this week? Public transportation is alright, but to really reap the benefits of a lowered footprint and better health, use what your momma gave ya. Ride a bike or take a walk anytime you need to get somewhere this week.", points: 40, progress_category: "Transportation"}, 
  {title: "Produce purchaser", caption: "Buy produce at the store to reduce packaging this month.", description: "You can reduce your trash by a metric fuck ton if you opt for produce over preprocessed foods. Your planet, and your body, will thank you this month.", points: 20, progress_category: "Waste"}, 
  {title: "Line Dryer", caption: "Hang clothes on the line to dry this month to save energy.", description: "Utilizing a clothes line to dry your laundry can save you x, y, and even Z amount of energy. Your clothes will look better, feel softer, and last longer. Try it for a month, but we bet you'll be hooked for longer.", points: 23, progress_category: "Home Energy"}, 
  {title: "Vegan Sampler", caption: "Not a vegan? Try it for two months and see how you do!", description: "It's a real hole in the bowl that the hardest part of being vegan is the first month. You don't see the benefits, your tastebuds still crave that sweet, sweet excess, and you haven't got in the habit of any new recipes. Thank goodness we're pushing you to do two months, then!", points: 35, progress_category: "Diet"}
  ])

rprof.profile_challenges.create(challenge_id: challenges[0].id, completed: true)
rprof.profile_challenges.create(challenge_id: challenges[4].id, completed: true)
rprof.profile_challenges.create(challenge_id: challenges[3].id, completed: false)

rprof.footprints.create([
  {total_emissions: 5000, water_emissions: 100, diet_emissions: 685, transportation_emissions: 3561, waste_emissions: 100, home_energy_emissions: 554},
  {total_emissions: 4000, water_emissions: 1000, diet_emissions: 868, transportation_emissions: 1200, waste_emissions: 132, home_energy_emissions: 800},
  {total_emissions: 3100, water_emissions: 600, diet_emissions: 451, transportation_emissions: 1049, waste_emissions: 70, home_energy_emissions: 930}, 
  {total_emissions: 1980, water_emissions: 120, diet_emissions: 612, transportation_emissions: 800, waste_emissions: 50, home_energy_emissions: 398}, 
  {total_emissions: 990, water_emissions: 90, diet_emissions: 420, transportation_emissions: 250, waste_emissions: 30, home_energy_emissions: 200}, 
  {total_emissions: 495, water_emissions: 95, diet_emissions: 246, transportation_emissions: 0, waste_emissions: 54, home_energy_emissions: 100}])