class Review < ApplicationRecord
  belongs_to :user
	belongs_to :trip
	validates :rating, numericality: {greater_than: -1, less_than:101}

end
