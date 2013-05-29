︠2d4e49ef-65dd-430b-a29a-ffc1b717dd75︠
%md

## A Markov Model of a Gamer
A gamer may have 4 different states where they may say certain phrases:

1. Playing Online Multiplayer : 'Noob', 'OMG, friken lag'

2. Playing a Role Playing Game before eating:  'need food', 'OMG, friken lag'

3. Playing a RPG after food:  'zzzzz', 'need food' #note that gamers eat all the time

4. Sleeping: 'zzzzz'


Saying an phrase is equally likely. The probability of moving to any stage is giving by the following:

Online->online 90%

Online->RPG before food 5%

Online->sleeping 5%

RPG before eating -> RPG before 80%

RPG before eating -> RPG after 8%

RPG before -> sleeping 2%

RPG after -> sleeping 99%

RPG after-> RPG after 1%

Sleeping -> sleeping 97%

sleeping -> online 3%

︡1b27e57b-ab62-4d34-9905-b05412aa26f4︡{"html":"<h2>A Markov Model of a Gamer</h2>\n\n<p>A gamer may have 4 different states where they may say certain phrases:</p>\n\n<ol>\n<li><p>Playing Online Multiplayer : &#8217;Noob&#8217;, &#8217;OMG, friken lag&#8217;</p></li>\n<li><p>Playing a Role Playing Game before eating:  &#8217;need food&#8217;, &#8217;OMG, friken lag&#8217;</p></li>\n<li><p>Playing a RPG after food:  &#8216;zzzzz&#8217;, &#8217;need food&#8217; #note that gamers eat all the time</p></li>\n<li><p>Sleeping: &#8216;zzzzz&#8217;</p></li>\n</ol>\n\n<p>Saying an phrase is equally likely. The probability of moving to any stage is giving by the following:</p>\n\n<p>Online->online 90%</p>\n\n<p>Online->RPG before food 5%</p>\n\n<p>Online->sleeping 5%</p>\n\n<p>RPG before eating -> RPG before 80%</p>\n\n<p>RPG before eating -> RPG after 8%</p>\n\n<p>RPG before -> sleeping 2%</p>\n\n<p>RPG after -> sleeping 99%</p>\n\n<p>RPG after-> RPG after 1%</p>\n\n<p>Sleeping -> sleeping 97%</p>\n\n<p>sleeping -> online 3%</p>\n"}︡
︠e49e07d5-a964-4ae6-8e14-a91c081b8200︠

A = matrix(RR, 4, [.90, .05, 0,  .05,  # online
                   0, .80, .08, .02,  # RPG before eating
                    0,   0, .01, .99, # RPG after eating
                   .03,   0,   0, .97]) # sleep


emission_symbols = ['Noob', 'OMG, friken lag', 'need food', 'zzzzz']
B = matrix(RR, 4, 4, [.6,.4,0,0,  # online
                      0,.2,.8,0,  # RPG before eating
                      0,0,.1,.9, # RPG after eating
                      0,0,0,1]) # asleep


initial = [1,0,0,0]

model = hmm.DiscreteHiddenMarkovModel(A, B, initial, emission_symbols)
︡bad6c5b3-3cc3-41f5-942d-9c0a081da0e5︡
︠de5568bc-4295-4adb-b2bf-e10e93980483︠
model
set_random_seed(0); model.sample(10)
︡5c849c60-c38c-4cb7-bec6-46f3aaed7d8d︡{"stdout":"Discrete Hidden Markov Model with 4 States and 4 Emissions\nTransition matrix:\n[            0.9            0.05             0.0            0.05]\n[            0.0  0.888888888889 0.0888888888889 0.0222222222222]\n[            0.0             0.0            0.01            0.99]\n[           0.03             0.0             0.0            0.97]\nEmission matrix:\n[0.6 0.4 0.0 0.0]\n[0.0 0.2 0.8 0.0]\n[0.0 0.0 0.1 0.9]\n[0.0 0.0 0.0 1.0]\nInitial probabilities: [1.0000, 0.0000, 0.0000, 0.0000]\nEmission symbols: ['Noob', 'OMG, friken lag', 'need food', 'zzzzz']\n['Noob', 'Noob', 'Noob', 'Noob', 'Noob', 'OMG, friken lag', 'Noob', 'Noob', 'Noob', 'OMG, friken lag']\n"}︡
︠7c9b6fc1-5218-4f90-8a1b-baf47f81c66e︠

