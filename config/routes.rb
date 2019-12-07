Rails.application.routes.draw do
	root 'trips#index'
  devise_for :users

	get 'random', to: 'trips#random'

	resources :trips do
		resources :locations
		resources :reviews, :only => [:show,:new,:edit]
  end

  resources :locations do
    resources :addresses
	end
	
	resources :reviews, :except => [:show, :new, :edit]
end
