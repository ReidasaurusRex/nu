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

BlogPost.create([
  {author_id: 4, title: "Civiliation, Consumerism, and Taking Risks", description: "Reid talks about the rise of consumerism in our culture, and the potential beauty of breaking free of it.", body: "I feel like I should begin with a disclaimer. With some posts, I feel somewhat qualified to talk about the things I'm talking about. Whether that is due to a class, a good book I read, or probings to my internal feelings, I sort of feel like maybe I know what I'm talking about. This post is different. I have no idea what I'm talking about. It's just a compilation of a lot of seemingly unrelated thoughts into a coherent piece. Personally, I think it's kind of neat. I hope you find the same.<PARAGRAPH>
I have a bachelor's of science in Biology, and that often makes me think of things that require longevity through an evolutionary lens. One of those things is civilization; how did it come about? Why is it so predominant among our species? The conclusion I came to was that civilization, whether intentionally or accidentally, functions as a mechanism to reduce the risk for groups of humans. This functionality, I feel, gave certain groups of humans a sort of leg-up on natural selection; when groups of humans have a technological or cultural breakthrough that allows them to reduce their risk of disease, starvation, or anything else that might kill them off, the group has a higher chance of survival.<PARAGRAPH>
The largest of these breakthroughs, in my opinion, was agriculture. Societies that developed agricultural tools and tendencies lessened the chance of their starvation, .which opened the door to further technological breakthroughs, further mitigating environmental risks. Eventually, I think enough groups of people mitigated the risks of their natural environment that the environmental pressures against them shifted from natural to man-made. Gradually, technologies that provided more food and clean water became less advantageous than those technologies that helped protect and destroy other groups of humans. Due to this, mitigation of risk went from coinciding well with your environment to amassing as many resources as possible: land, weapons, people, walls, etc.<PARAGRAPH>
Out of these new evolutionary pressures arose a new advancement: economies. Cultures that had the added efficiency of being able to trade goods and services through a universal currency quickly gained the upper hand on those that didn't establish some sort of currency exchange program. Due to this, the 'evolutionary' pressures on society shifted yet again to a much more streamlined pressure: whoever had the most wealth had the greatest advantage (assuming they allocated this wealth properly into resources, but you get my gist). Therefore, societies that were best at resource extraction, conversion of these resources to wealth, and then allocating this wealth become societies that survived. (Again, broad strokes, but for the sake of brevity, that's the only brush I brought).<PARAGRAPH>
In my opinion, this remains to be the dominant pressure upon societies today. A brief tie in: civilization continues to mitigate risk, and now that means accruement of wealth. Keeping the economy going seems, at least in Western civilizations, the new doctrine for all things spiritual and physical. In some ways, I find this lovely. It is because of this wealth accruement mindset that so many aspects of modern civilization that I love exist: roads, technological advances, the internet. However, this doctrine has some side effects that I'm not so fond of.<PARAGRAPH>
What would some of those be, you say? Well! Historically, they're abound. The near clear cutting of true cultural diversity due to colonialism and globalization; slaughter of indigenous populations for acquisition of resources; armies, just sort of in general, all the time (assuming that the army is used to protect that nation's wealth. Or its livelihood, which is likely being jeopardized by another nation looking to gain more wealth.)<PARAGRAPH>
Unfortunately, these detrimental side effects don't end there. Armies continue to exist to protect and acquire new economic investments; human rights are still put on the chopping block so that goods and services can be developed at larger numbers and lower prices; globalization continues to massacre cultural diversity. There is one, however, that I'd like to talk about more at length.<PARAGRAPH>
Resulting from our increase in production capacity from the World Wars, my country's economic vitality became dependent upon a nation of consumers. As economic vitality back then was just as worshipped as it is now, the increase in consumerism in American society, and elsewhere, has grown seemingly unimpeded. On an individual level, I harken this back to civilization's goal: risk mitigation. Through a near constant battery of advertisements from people trying to accrue more wealth (what?), we have come to believe that we can remove all the risk out of our lives by buying shit. Lonely? Buy a subscription to a dating service. Bored? Buy a ticket to a movie. Hungry? Buy this hamburger. Worried about your image? Buy these clothes!<PARAGRAPH>
In my opinion, and excuse my bluntness: this is bullshit. If ever you're fortunate enough to get the mental opportunity to take a step back and say \"Hmm. I wonder if all those ads are full of crap? Maybe I don't need so much stuff,\" take it. Worst situation is you'll try out a different perspective and maybe go back to buying stuff. However, I doubt it. I think you'll likely fall in love with the risk of falling in love. I think you'll be thrilled by the rush of spelunking into your own emotions and thoughts, rather than distracting your time in this life with useless crap, err stuff.<PARAGRAPH>
In a bizarre twist, the risk mitigation of civilization now seems to be giving us the shaft. For a lot, if not most of us, in Western society, the natural risks are already mitigated: you have food, you have shelter, you have water. Now, we're attempting to outsource life's greatest risks (companionship, fulfillment, etc) to things, so that our economy can mitigate its own risk. It is my hope that you think to maybe call bull on that. It's a process I'm in now, and I'm loving it. Maybe it's selfish, but coming to the realization that what's best for the economy, and what advertisements are telling me is best for life, may not be the best for me, is an incredibly eye opening and rewarding realization. Now, I finally feel I can truly search out for my own route. I can truly try to find fulfillment in this life.<PARAGRAPH>
What does that look like? I can't say. Not for you, anyway. For me, right now, it looks like a blend of minimalism, environmentalism, music, learning, and meaningful work. The hardest of these to start to understand in today's society is the minimalist part, so! If you have interest in exploring my interest, I've put a link to my favorite minimalist blog.<PARAGRAPH>
Phwew. That... was a rant. A really long rant. If you're reading this, good on ya for sticking through. I hope it made any semblance of sense. More than that, however, I hope it provided a new frame of thought for you. One that will help you go out and explore the world once again.<PARAGRAPH>
Cheers."}])