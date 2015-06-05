# users = [
#   {
#     first_name: 'Sue',
#     last_name: 'Qi',
#     email: 'exafdfsdfsmple1@example.com',
#     address: '3530n Tilden St',
#     city: 'Washington',
#     state: 'DC',
#     zip: '09888',
#     password: 'a1234dsad56hg78'
#   },
#   {
#     first_name: 'Ron',
#     last_name: 'Burgundy',
#     email: 'examplfasdfasde2@example.com',
#     address: '1 Appleton Street',
#     city: 'Boston',
#     state: 'MA',
#     zip: '02118',
#     password: 'b1fhjkh2345678'
#   },
#   {
#     first_name: 'Ruth',
#     last_name: 'Wadsworth',
#     email: 'kjsbdgas6dfg@example.com',
#     address: '127 Waban st.',
#     city: "Wellesley",
#     state: 'MA',
#     zip: '02119',
#     password: 'cl12345d678'
#   },
#   {
#     first_name: 'Michael',
#     last_name: 'Michaelson',
#     email: 'fasdfsafertv_@example.com',
#     address: '1 Arbor Way',
#     city: 'Jamaica Plain',
#     state: 'MA',
#     zip: '02130',
#     about: 'Single dad. Working hard as a hand model and caring for two kids.',
#     password: 'k1234dsaad5678'
#   },
#   {
#     first_name: 'Kevin',
#     last_name: 'Smith',
#     email: 'bfysd7f68ywoiebr@example.com',
#     address: '34 Water Street',
#     city: 'Boston',
#     state: 'MA',
#     zip: '02130',
#     about: 'I am awesome!',
#     password: 'r123ddasdasd45678'
#   },
#   {
#     first_name: 'Travis',
#     last_name: 'Ci',
#     email: 'kjagpasd7g@example.com',
#     address: '34 Winter Street',
#     city: 'Cambridge',
#     state: 'MA',
#     zip: '02142',

#     about: 'I am great at what I do!',
#     password: 'e123456dsa78'
#   },
#   {
#     first_name: 'Robert',
#     last_name: 'Smith',
#     email: '6gsdgsfsdfsew4+@example.com',
#     address: '60 Perkins Street',
#     city: 'Jamaica Plain',
#     state: 'MA',
#     zip: '02160',
#     password: 'e12345ds678'
#   },
#   {
#     first_name: 'Kevin',
#     last_name: 'Smith',
#     email: 'hfw7ff@example.com',
#     address: '34 Water Street',
#     city: 'Boston',
#     state: 'MA',
#     zip: '02130',
#     password: 'u123456ds78'
#   },
#   {
#     first_name: 'Gaius ',
#     last_name: 'Baltar',
#     email: 'fgteggd@example.com',
#     address: '100 Galaxy Way',
#     city: 'Caprica City',
#     state: 'CAP',
#     zip: '021302466453',
#     about: 'I specialize in the manufacture of Cylon detectors.',
#     password: 'w123ds45678'
#   },
#   {
#     first_name: 'Han',
#     last_name: 'Solo',
#     email: 'asdfasdfasfert@example.com',
#     address: '6560',
#     city: 'Cloud City',
#     state: 'CL',
#     zip: '0212342111',
#     password: 'ewe4123das45678'
#   }
# ]
# users.each do |user_hash|
#   user_attr = {
#     first_name: user_hash[:first_name],
#     last_name: user_hash[:last_name],
#     email: user_hash[:email],
#     address: user_hash[:address],
#     city: user_hash[:city],
#     state: user_hash[:state],
#     zip: user_hash[:zip],
#     profile_photo: user_hash[:profile_photo],
#     about: user_hash[:about],
#     password: user_hash[:password]
#   }

#   # user = User.find_by(user_attr)
#   user ||= User.create!(user_attr)
# end

events = [
  {
    user_id: 1,
    title: 'Sushi party',
    address: '3530n Tilden St',
    city: 'Washington',
    state: 'DC',
    zip: '09888',
    start_time: DateTime.parse('2015-09-19T17:30:00+00:00'),
    duration: '1 to 2 hours',
    guest_count: 9,
    budget: 30,
    description: 'Looking to host a sushi making cooking class for my
    girlfriends 30th birthday party.
    I have a large modern kitchen. Will be providing alcohol but want helping
    selection Saki to go with the food.'
  },
  {
    user_id: 2,
    title: 'Pig roast',
    address: '50 Center Street',
    city: 'Boston',
    state: 'MA',
    zip: '02130',
    start_time: DateTime.parse('2016-10-19T19:30:00+00:00'),
    duration: '4 to 5 hours',
    guest_count: 30,
    budget: 12,
    description: 'Want to have a back yard pig roast for my "foodie friends".
    Want someone to cleanup and provide beer.'
  },
  {
    user_id: 3,
    title: 'Tea time',
    address: '127 Waban st.',
    city: "Wellesley",
    state: 'MA',
    zip: '02119',
    start_time: DateTime.parse('2016-11-21T13:00:00+00:00'),
    duration: '1 to 2 hours',
    guest_count: 5,
    budget: 30,
    description: "I am hosting afternoon tea for several London guests.
    Must deliver exquisitely crafted tea sandwiches, cakes and biscuits. Preparation will not be done on site"
  },
  {
    user_id: 4,
    title: 'Backyard BBQ',
    address: '50 8th St.',
    city: 'North Redding',
    state: 'MA',
    zip: '02663',
    start_time: DateTime.parse('2016-09-10T12:00:00+00:00'),
    duration: '2 to 3 hours',
    guest_count: 15,
    budget: 10,
    description: 'Its my kids 2nd birthday and I just need someone to man the
    grill while I tend to the party.
    I will provide the materials needed.'
  },
  {
    user_id: 5,
    title: 'Dinners for the week',
    address: '34 Water Street',
    city: 'Boston',
    state: 'MA',
    zip: '02130',
    start_time: DateTime.parse('2016-12-27T11:00:00+00:00'),
    duration: '1 to 2 hours',
    guest_count: 4,
    budget: 50,
    description: "My wife is having a baby next week and we need someone to
    cook a bunch of dinners for the week.
    There are several dietary restrictions to be discussed."
  },

  {
    user_id: 6,
    title: 'Office lunch for the staff',
    address: '221 South Huntington Ave',
    city: 'Boston',
    state: 'MA',
    zip: '02130',
    start_time: DateTime.parse('2017-07-27T11:00:00+00:00'),
    duration: '2 to 3 hours',
    guest_count: 50,
    budget: 10,
    description: "This is a monthly thing that we do. Looking for verity and
    vegan friendliness. This could become a permanent gig
    fir the right person"
  },
  {
    user_id: 7,
    title: 'Romantic dinner for a couple',
    address: '21 Beacon St',
    city: 'Boston',
    state: 'MA',
    zip: '02166',
    start_time: DateTime.parse('2016-11-27T19:00:00+00:00'),
    duration: '2 to 3 hours',
    guest_count: 4,
    budget: 500,
    description: "My wife is having an anniversary and want a super high-end
    chef to cook dinner for us in our Back Bay condo."
  },
  {
    user_id: 8,
    title: 'BBQ!!!',
    address: '32 Blah St',
    city: 'Boston',
    state: 'MA',
    zip: '02188',
    start_time: DateTime.parse('2016-10-12T13:00:00+00:00'),
    duration: '6 + hours',
    guest_count: 40,
    budget: 100,
    description: "I am from TX and want to have a good old fashioned Texas BBQ.
    I will do the cooking but need a smoker,
    brisket and a trained set of hands. Must know BBQ!!"
  },
  {
    user_id: 9,
    title: "Hors d'oeuvre",
    address: '34 Rich Street',
    city: 'Boston',
    state: 'MA',
    zip: '02119',
    start_time: DateTime.parse('2016-12-29T20:00:00+00:00'),
    duration: '3 to 4 hours',
    guest_count: 30,
    budget: 100,
    description: "I want to throw a New years eve party for friends. Need high
    end Hors d'oeuvre and snacks. Also would be interested in hiring a
    bartender. "
  },
  {
    user_id: 10,
    title: 'Cooking classes',
    address: '21 Winter St',
    city: 'Sommerville',
    state: 'MA',
    zip: '02110',
    start_time: DateTime.parse('2016-11-10T11:00:00+00:00'),
    duration: '2 to 3 hours',
    guest_count: 4,
    budget: 100,
    description: "I am looking for a chef to teach a cooking class for myself
    and a small group of friends. I like Italian and Greek food."
  }
]

events.each do |event_hash|
  event_attr = {
    user_id: event_hash[:user_id],
    title: event_hash[:title],
    address: event_hash[:address],
    city: event_hash[:city],
    state: event_hash[:state],
    zip: event_hash[:zip],
    start_time: event_hash[:start_time],
    duration: event_hash[:duration],
    guest_count: event_hash[:guest_count],
    budget: event_hash[:budget],
    description: event_hash[:description]
  }

  event = Event.find_by(event_attr)
  event ||= Event.create!(event_attr)
end
