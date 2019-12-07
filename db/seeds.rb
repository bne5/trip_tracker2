if User.all == nil
	user = User.create(
		:email                 => "test@test.com",
		:password              => "password",
		:password_confirmation => "password"
	)
else
	user = User.all[0]
end

10.times do 
	trip = Trip.create(
		name: Faker::Nation.capital_city,
		start_date: Faker::Date.between(from: 2.days.ago, to: 2.days.from_now),
		end_date: Faker::Date.forward(days: 67),
		user_id: user.id
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
end

puts "Database seeded!"