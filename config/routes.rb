Rails.application.routes.draw do
	root 'home#index'

	resources :users, :organisations, :shifts
	resources :sessions, only: [:new, :create, :destroy]

	get 'signup', to: 'users#new', as: 'signup'
	get 'login', to: 'sessions#new', as: 'login'
	get 'logout', to: 'sessions#destroy', as: 'logout'
  	get 'sessions/new'
  	get 'sessions/create'
  	get 'sessions/destroy'
  	get 'organisations/new'
  	get 'organisations/create'
  	get 'organisations/destroy'

  	get 'organisations/join/:id', to: 'organisations#join', as: 'join_organisations_path'
    get 'organisations/leave/leave', to: 'organisations#leave', as: 'leave_organisations_path'
end
