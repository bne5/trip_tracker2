class ReviewsController < ApplicationController
	before_action :set_review, only: [:show, :edit, :destroy]
	before_action :set_owner, only: [:edit, :destroy]
	def index
		@reviews = Review.all
  end

	def show
		
  end

	def new
		@review = Review.new
	end
	
	def create
		@review = Review.new(review_params)
		if @review.save
			redirect_to reviews_path
		else
			render :new
		end
	end

	def edit

	end
	
	def update
		if @review.update(review_params)
			redirect_to reviews_path
		else
			render :edit
		end
	end

	def destroy
		@review.destroy
		redirect_to reviews_path
	end
	
	
	private 
		def set_review
			@review = Review.find(params[:id])
		end

		def set_trip
			@trip = Trip.find(params[:trip_id])
		end

		def set_owner
			@is_owner = current_user.id == @review.user_id
		end

		def review_params
			params.require(:review).permit(:rating,:body, :author)
		end

end
