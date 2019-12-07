i = 0
until User.all.length > 3
	str = ""
	if i > 0
		str = "#{i}"
	end
	user = User.create(
		:email                 => "test#{str}@test.com",
		:password              => "password",
		:password_confirmation => "password",
		:first_name => Faker::Name.first_name,
		:last_name => Faker::Name.last_name
	)
	puts "New User! #{user.id}"
	i+=1
end

10.times do 
	trip = Trip.create(
		name: Faker::Nation.capital_city,
		start_date: Faker::Date.between(from: 2.days.ago, to: 2.days.from_now),
		end_date: Faker::Date.forward(days: 67),
		user_id: User.all.sample.id
	)
	4.times do 
		loc = Location.create(
			name: Faker::Name.initials(number: 2),
			days: rand(32),
			trip_id: trip.id
		)
		Address.create(
			street: Faker::Address.street_address,
			city: Faker::Address.city,
			state: Faker::Address.state,
			zip: Faker::Address.zip,
			location_id: loc.id
		)
	end
	2.times do
		author = User.find(trip.user_id).first_name == nil ? "Anonymous" : User.find(trip.user_id).first_name
		Review.create(
			author: author,
			rating: rand(101),
			body: Faker::TvShows::TheFreshPrinceOfBelAir.quote,
			user_id: trip.user_id,
			trip_id: trip.id
		)
  end
end

puts "Database seeded!"