Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/index'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users, :organisations, :shifts

	root 'home#index'

	resources :sessions, only: [:new, :create, :destroy]
	  get 'signup', to: 'users#new', as: 'signup'
	  get 'login', to: 'sessions#new', as: 'login'
	  get 'logout', to: 'sessions#destroy', as: 'logout'
end
