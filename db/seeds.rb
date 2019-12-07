user = User.create(
	:email                 => "test@test.com",
	:password              => "password",
	:password_confirmation => "password"
)

puts "user generated!", user