class TripsController < ApplicationController

	before_action :set_trip, only: [:show, :edit, :update, :destroy]

	def index
		@trips = current_user.trips
  end

	def show
  end
	
	def new
		@trip = Trip.new
	end
	
	def create
		@trip = current_user.trips.new(trip_params)
		if @trip.save
			redirect_to trips_path
		else
			render :new
		end
	end

	def edit	
	end

	def update
		if @trip.update(trip_params)
      redirect_to trip_path
    else
      render :edit
    end
	end

	def destroy
		@trip.destroy
		redirect_to trips_path
	end

	def random
		@randoms = current_user.trips.sample(5)
	end
	
	private
		def set_trip
			@trip = current_user.trips.find(params[:id])
		end

		def trip_params
			params.require(:trip).permit(:name, :start_date, :end_date)
		end
end
