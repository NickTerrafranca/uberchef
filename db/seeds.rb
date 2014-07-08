events = [
  {
    user_id: 1,
    title: 'Sushi party',
    address: '3530n Tilden St',
    city: 'Washington',
    state: "DC",
    zip: '09888',
    start_time: DateTime.parse('2014-09-19T17:30:00+04:00'),
    end_time: DateTime.parse('2014-09-19T21:30:00+04:00'),
    guest_count: 9,
    budget: 30,
    description: 'Looking to host a sushi making cooking class for my girlfriends 30th birthday party.
    I have a large modern kitchen. Will be providing alcohol but want helping selection Saki to go with the food.'
  },
  {
    user_id: 2,
    title: 'Pig roast',
    address: '50 Center Street',
    city: 'Boston',
    state: 'MA',
    zip: '02130',
    start_time: DateTime.parse('2014-07-19T19:30:00+04:00'),
    end_time: '',
    guest_count: 30,
    budget: 12,
    description: 'Want to have a back yard pig roast for my "foodie friends". Want someone to cleanup and provide beer.'
  },
  {
    user_id: 3,
    title: 'Tea time',
    address: '127 Waban st.',
    city: "Wellesley",
    state: 'MA',
    zip: '02119',
    start_time: DateTime.parse('2014-07-29T13:00:00+04:00'),
    end_time: '',
    guest_count: 5,
    budget: 30,
    description: "I am hosting afternoon tea for several London guests.
    Must deliver exquisitely crafted tea sandwiches, cakes and biscuits"
  },
  {
    user_id: 4,
    title: 'Backyard BBQ',
    address: '50 8th St.',
    city: 'North Redding',
    state: 'MA',
    zip: '02663',
    start_time: DateTime.parse('2014-08-10T12:00:00+04:00'),
    end_time: DateTime.parse('2014-08-10T14:30:00+04:00'),
    guest_count: 15,
    budget: 10,
    description: 'Its my kids 2nd birthday and I just need someone to man the grill while I tend to the party.
    I will provide the materials needed.'
  },
  {
    user_id: 5,
    title: 'Dinners for the week',
    address: '34 Water Street',
    city: 'Boston',
    state: 'MA',
    zip: '02130',
    start_time: DateTime.parse('2014-07-27T11:00:00+04:00'),
    end_time: '',
    guest_count: 4,
    budget: 100,
    description: "My wife is having a baby next week and we need someone to cook a bunch of dinners for the week.
    There are several dietary restrictions to be discussed."
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
    end_time: event_hash[:end_time],
    guest_count: event_hash[:guest_count],
    budget: event_hash[:budget],
    description: event_hash[:description]
  }

  event = Event.find_by(event_attr)
  event ||= Event.create!(event_attr)
end

users = [
  {
    first_name: 'Sue',
    last_name: 'Qi',
    email: 'nterrafranca@hotmail.com',
    address: '3530n Tilden St',
    city: 'Washington',
    state: "DC",
    zip: '09888',
    profile_photo: '',
    about:''
  },
  {
    first_name: 'Ron',
    last_name: 'Burgundy',
    email: 'nterrafranca@hotmail.com',
    address: '1 Appleton Street',
    city: 'Boston',
    state: 'MA',
    zip: '02118',
    profile_photo: '',
    about:''
  },
  {
    first_name: 'Ruth',
    last_name: 'Wadsworth',
    email: 'nterrafranca@hotmail.com',
    address: '127 Waban st.',
    city: "Wellesley",
    state: 'MA',
    zip: '02119',
    profile_photo: '',
    about:''
  },
  {
    first_name: 'Michael',
    last_name: 'Michaelson',
    email: 'nterrafranca@hotmail.com',
    address: '1 Arbor Way',
    city: 'Jamaica Plain',
    state: 'MA',
    zip: '02130',
    profile_photo: '',
    about: 'Single dad. Working hard as a hand model and caring for two kids.'
  },
  {
    first_name: 'Kevin',
    last_name: 'Smith',
    email: 'nterrafranca@hotmail.com',
    address: '34 Water Street',
    city: 'Boston',
    state: 'MA',
    zip: '02130',
    profile_photo: '',
    about: "I am awesome!"
  }
]
users.each do |user_hash|
  user_attr = {
    first_name: user_hash[:first_name],
    last_name: user_hash[:last_name],
    email: user_hash[:email],
    address: user_hash[:address],
    city: user_hash[:city],
    state: user_hash[:state],
    zip: user_hash[:zip],
    profile_photo: user_hash[:profile_photo],
    about: user_hash[:about]
  }

  user = User.find_by(event_attr)
  user ||= User.create!(event_attr)

end
