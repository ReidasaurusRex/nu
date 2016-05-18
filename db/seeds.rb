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
  {title: "Educate Your Eyeballs", caption: "Watch three environmental documentaries", description: "Knowledge is power! Snuggle in with a bowl of locally grown strawberries or anything besides popcorn and educate yourself!", difficulty: 1, points: 12, progress_category: "social"}, 
  {title: "Learn With Your Brain", caption: "Read two environmental books", description: "There are very few benefits to literacy. One of the few good things it that it allows you to complete this challenge. Learn some cool stuff an topics ranging from climate change and deforestation to pollution and endangered species. You'll learn some great stuff and finally have the background to have an intelligent conversation with a hippy.", difficulty: 3, points: 17, progress_category: "social"}, 
  {title: "Kill Fewer Animals", caption: "Eat vegan or vegetarian for two weeks", description: "Feeding 7 billion people every day is a huge task, and one that takes a large toll on our planet. Producing meat uses many more resources than producing other types of foods. It makes sense, right? You could either eat some beans, or feed the beans to some cows, do a whole bunch more work, and then eat the cows. Which sounds like the more environmentally responsible option?", difficulty: 3, points: 17, progress_category: "diet"}, 
  {title: "Put Them Sweet Gams To Use!", caption: "Walk or bike instead of driving for one week", description: "Look, I love my Ferrari as much as the next guy. But it's better for the planet to keep it in the garage. Walking or biking to your destination is the single best thing you can do for the environment. Try it for a week: you'll be surprised how easy it is.", difficulty: 5, points: 18, progress_category: "transportation"}, 
  {title: "Chaste Behavior", caption: "Take cold showers this week", description: "Don't believe the hype; hot showers aren't so great. Cold showers are the exact same thing, no matter what the fat cats in Washington would have you believe. But, cold showers don't require any energy to heat the water, saving energy and helping our sweet world.", difficulty: 2, points: 15, progress_category: "home_energy"},
  {title: "Buy Hippie Food", caption: "Shop only at farmers' markets this month", description: "There's more to those hippies at the local market than just flannel, sandals, and good vibrations. Turns out they can actually turn dirt into food. And they can usually do it in a way that's great for the environment. Plus, buying from them means you can learn exactly where your food comes from, and advocate for best practices. And that stuff's way tastier than grocery store stuff.", difficulty: 3, points: 18, progress_category: "diet"},
  {title: "You Aren't God, Stop Screwing The Weather", caption: "Bring your AC or heat up or down two degrees to align with the weather", description: "The very idea of making air be something it isn't naturally seems pretty outrageous when you think about it. You think, just because you have a big metal box in your window, that you're some type of God who can control the weather? Bring it down two notches, buddy, before you get smote from on high. Also, save some energy and some CO2.", difficulty: 3, points: 18, progress_category: "home_energy"},
  {title: "Make Yourself Less Dumb", caption: "Read a book rather than watch TV this week", description: "Grandma's been saying it for years: TV rots your brain and reading makes you smart. Plus, every second you spend not watching TV is a second spent not using energy you don't really need. Save money, save energy, save the planet, learn something.", difficulty: 2, points: 15, progress_category: "home_energy"},
  {title: "Sleep Natural", caption: "Go to bed one hour earlier this week", description: "If you go to bed when it's dark and wake up when it's light, instead of using a bunch of lights to keep your house bright, you'll save energy and live more in rythym with the natural order. ", difficulty: 3, points: 16, progress_category: "home_energy"},
  {title: "Tell Your Friends!", caption: "Start ten conversations about sustainability", description: "I'll tell you a secret: everyone loves strangers talking about the environment. Seriously. Give it a try and I promise you'll make tons of friends. Plus, if you can make them smarter, then you're creating more advocates for the environment. Tell them about Nu and they can help us with our goal of reduced emissions for everyone!", difficulty: 2, points: 13, progress_category: "social"},
  {title: "Your Lawn Doesn't Care What Color It Is", caption: "Water your lawn half as much this month", description: "Watering the lawn takes tons of water. No one cares what color your house is; why should they care what color the stuff around it is?", difficulty: 1, points: 16, progress_category: "Water"},
  {title: "Ride A Bus", caption: "Use public transport instead of driving for two weeks", description: "I know what you're going to say: the bus is gross and chicks dig your 2001 Toyota Camry. Well, those chicks wouldn't dig it so much if they knew that the ol' Toyota was the single biggest source of emissions in your life. Do the smart thing for the environment and for the ladies and take a train or bus or something.", difficulty: 2, points: 16, progress_category: "transportation"},
  {title: "The Caribbean Isn't That Great Anyway", caption: "Vacation close to home", description: "Everyone knows planes are bad for the environment. All you have to do is look up to see them emitting all those nasty chemtrails. This year, try a \"staycation\" - keep close to home to avoid flights and reduce your emissions.", difficulty: 3, points: 18, progress_category: "transportation"},
  {title: "Fat Tire", caption: "Go inflate your tires properly, and keep them that way", description: "Check your tire pressure twice a week to catch and fix any problems. It's a simple thing that can have an impact on your fuel efficiency and therefore your emissions. Keep this habit up for a month and you'll get some sweet savings.", difficulty: 1, points: 16, progress_category: "transportation"},
  {title: "Share The Burden", caption: "Carpool to work for a month", description: "There's no reason for you to be alone on your daily slog to work. In fact, you might find having a buddy along does good things to your morale. Regardless, removing a car from the road is a great thing for the blue and green ball (Earth). And, the more people you get to participate, the larger your impact and the better a person you suddenly are!", difficulty: 2, points: 17, progress_category: "transportation"},
  {title: "Solar Power To The People", caption: "Sign up with your electricity utility's renewable energy program to switch half of your average monthly electricity to renewables", description: "We can't wait for other people to fix electricity. It's one of the largest sources of emissions for individuals, and it's a major problem. Luckily, the future is now - there are already ways to invest in renewable energy, giving it a welcome boost. Check out this website http://apps3.eere.energy.gov/greenpower/buying/buying_power.shtml to see how to enroll.", difficulty: 3, points: 15, progress_category: "home_energy"},
  {title: "Greenthumb", caption: "Plant a tree", description: "Trees are great: they look nice, they smell nice, they give us oxygen, and they give us apples and oranges and stuff like that. Go put one in the ground.", difficulty: 2, points: 13, progress_category: "social"},
  {title: "Be Cool", caption: "Ride a motorcycle instead of driving for a month", description: "Besides being way better for the environment, both in terms of their initial production (less stuff pulled from the earth) and daily operation (less gas), motorcycles are precisely 269 times cooler than cars.", difficulty: 4, points: 19, progress_category: "transportation"},
  {title: "Spread The Word!", caption: "Organize an event for the environment", description: "Whether it's a rally or a riot, there's nothing better for the environment than recruiting new warriors for the planet and using them to show people how it be.", difficulty: 5, points: 19, progress_category: "social"},
  {title: "Just Like Grandma Used To Do", caption: "Don't use any electricity during the day for two weeks", description: "We won't count time spent at work, but if you can use zero electricity when the sun's out, you'll be miles ahead of everyone else. Really, it isn't that hard. Just open the shades for some natural light and read a book or go for a walk instead of watching TV. Just like life was in the 19th century! Yay!", difficulty: 3, points: 18, progress_category: "home_energy"},
  {title: "Grow Your Meals", caption: "Start a garden", description: "The current agriculture scene is pretty out of whack. The more local you can make your food, the better. And there's nothing more local than your own backyard. Take the time to set up a nice garden, and you'll be rewarded for years to come with a healthy conscience and delicious veggies!", difficulty: 5, points: 20, progress_category: "diet"},
  {title: "Stinky Backyard Pile", caption: "Compost all organic waste for a month", description: "Throwing food away means it's in the waaste management system, which means someone has to expel a lot of energy to take care of it. It's easier for everyone if you just use your organic waste to compost. Then, you can use the compost to fuel that new garden you've wanted to make for so long! By the way, this challenge says \"for a month\" mostly for the sake of simplicity. Feel free to keep it going. You'll love it.", difficulty: 3, points: 18, progress_category: "waste"}
  ])

rprof.profile_started_challenges.create([
  {challenge_id: challenges[0].id},
  {challenge_id: challenges[3].id},
  {challenge_id: challenges[-2].id}
  ])

rprof.profile_started_challenges[0].started_challenge_updates.create([
  {challenge_id: challenges[0].id, difficulty: 1, update_number: 1},
  {challenge_id: challenges[0].id, difficulty: 1, update_number: 2}
  ])

rprof.profile_started_challenges[1].started_challenge_updates.create([
  {challenge_id: challenges[3].id, difficulty: 3, update_number: 1},
  {challenge_id: challenges[3].id, difficulty: 2, update_number: 2},
  {challenge_id: challenges[3].id, difficulty: 1, update_number: 3}
  ])


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
Cheers."},
  {author_id: 4, title: "Addiction and Nazis", description: "Reid tries to tie in the history of Nazis with modern addiction", body: "So, I have an addictive personality. I'm lucky in that the things that have really addicted me throughout my life haven't been intentionally engineered to make me physically hooked on them, but I have fought my battles none the less. This recognition of my addiction is part of the reason I have never tried most drugs, and try to remain extremely cognizant of my alcohol, soda, and even unhealthy food intake.<PARAGRAPH>
For me, my vice has always been video games. Slipping into imaginary worlds with instant, attainable gratification? Right up my Peter Pan complexed alley. This addiction isn't, I don't think, inherently malicious; I don't know of any friends or family that have been harmed by it. However, when I think of the time I've put in to conquering imaginary foes, demons, and dragons, I wonder what I could have in my life if I'd applied that time elsewhere; a concert pianist? a master chef? a journeyman tailor?<PARAGRAPH>
I never had the stones to call my addiction what it was until my sophomore year in college. I was in an English class, composition or something, and somehow the professor worked in our viewing of a short documentary on gaming, and its potential physical addiction. It's clear to me now the professor was trying to fight a moral battle with her professional position, but I'm glad she did; I never understood that my brain had become chemically addicted to the bright lights and rewards that were presented to me, until then.<PARAGRAPH>
Ever since that year, my fight has constantly been going. For much of the time, I lost. It is one of my greater regrets of college that I wasted so much time gaming rather than furthering my studies, seeing friends, or other extracurriculars (read: pottery). I like to think I'm winning it now, but often it's hard to tell. I still check into YouTube and watch League of Legends world finals from time to time.<PARAGRAPH>
When I'm winning the fight, one of the many things I do is read. I've grown to really enjoy reading once more, and have just finished a book about an American ambassador in Hitler's Berlin. It's a great book, titled In The Garden of Beasts. One of the things that struck me most bizarrely about it all was how little people were understanding the situation. It seemed like with every new anti-semitic law signed in, the rest of Europe and the US would proclaim that they wouldn't stand for this, and they'd enact economic sanctions, etc. The actual response? Pretty much absolutely nothing.<PARAGRAPH>
This really trips me out. Nowadays, people seem to blindly point fingers at the German population then, asking \"How could they have let that leader rise to power?\" Nobody ever seems to want to turn that finger around, and ask: \"How in the world did we let that leader screw over the German people?\"<PARAGRAPH>
Unfortunately, the world's 'sophomore year' moment, when they realized they had a problem on their hands, was after a country, an entire country, had been invaded and conquered. Before this, Hitler had assassinated, en masse, his potential competition, and systematically put legislation and protocol in place to push Jews out of the country, dead or alive.<PARAGRAPH>
So, how in the world does it all tie in? Why the talk about video games, then the talk about Hitler? I guess I wanted to talk about one of my greatest fears. It seems like, today, we are a very addictive society. I should preface this by saying I don't think addiction is always bad; I like to think it's what made me a good soccer player, solve some great Organic Chemistry problems, and really dig to understand things that interest me. However, the addictions I see today, in our society, aren't so hot. Were we addicted to the pursuit of peace, or bettering our neighbor, or producing beautiful art, or helping our environment, well that would be some really great shit. What I actually see are more akin to addiction to acquiring wealth, addiction to material goods, addiction to homogenizing things, and addiction to violence.<PARAGRAPH>
My great fear that I'd hoped to talk about is that we won't be able to overcome these addictions. I fear our sophomore year will be too late for many. What will it look like? It might look like the death of tens of thousands due to a US invasion of an oil rich country to secure more of the ever dwindling oil. It might look like mass assassinations of Brazilian environmentalists trying to protect the rainforest. It might look like all universities becoming trade schools. I'm not sure.<PARAGRAPH>
History seems to have this ability to look back with added clarity (more or less. read: Columbus Day ??? ). I worry, quite a bit that my children's generation, and their children, will look back at our generation as the generation of addicts. We seem to be realizing all these lifestyle and societal trends are terrible for not only ourselves, but also other people we share this Earth with, and seemingly the Earth itself in general. However, we also seem to be doing not a dang thing about it. I worry we're appeasing our own demons rather than taking them head on, and the metaphorical WWIII that will be fought in our own homes and hearts will leave us exhausted and defeated.<PARAGRAPH>
Yet! This worry is not without its counterpart. I see people from all areas and classes investigating new ways to live their lives, ways that can be kind to themselves and their surroundings. I see a movement of people that in a culture that says MORE! MORE! MORE!, have chosen less. Intentionally. Things like these give me hope.<PARAGRAPH>
The Peter Pan complex in me still likes to give a romantic, fantastical spin to things. I like to tell myself that there are plenty of demons and dragons to fight in the real world. I struggle often to overcome my addictions so that I can fight them with the courage and discipline I feel they require. I'm hoping that the society I'm living in is right by my side."}
  ])