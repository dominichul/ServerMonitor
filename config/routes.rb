Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/site_modal', to: 'users#site_modal'

  resources :users do
    resources :sites
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only:     [:new, :create, :edit, :update]

end
