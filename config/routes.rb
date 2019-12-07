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
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
