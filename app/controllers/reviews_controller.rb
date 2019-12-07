class ReviewsController < ApplicationController
	before_action :set_review, only: [:show, :edit, :destroy]

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
		unless owner?
			redirect_to @review
		end
	end
	
	def update
		if @review.update(review_params)
			redirect_to reviews_path
		else
			render :edit
		end
	end

	def destroy
		unless owner?
			redirect_to @review
		end
		@review.destroy
	end
	
	private 
		def set_review
			@review = Review.find(params[:id])
		end

		def review_params
			params.require(:review).permit(:author,:rating,:body)
		end

		def owner?
			current_user.id == @review.user_id
		end

end
