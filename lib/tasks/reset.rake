
namespace :reset do
	desc "This rake resets database and starts server"
	task :server do
		puts "Reseting database and starting server"
		system 'rails db:reset && rails s'
	end
end
