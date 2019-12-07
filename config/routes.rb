Rails.application.routes.draw do
	root 'reviews#index'
  devise_for :users

	get 'random', to: 'trips#random'

	resources :trips do
    resources :locations
  end

  resources :locations do
    resources :addresses
	end
	
	resources :reviews
  
end
