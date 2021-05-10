Rails.application.routes.draw do
  resources :contacts
  resources :friends
  get 'ctrl1/home'
  get 'ctrl1/help'
  get 'users/payment'
  get 'ctrl1/friends'
  get 'static/home'
  get 'sessions/new'
  get 'friends_controller/new'
  resources :users #creates appropriate routes for create, read, update, destroy(CRUD)
  resources :friends
  resources :payments
  resources :contact

  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  
  delete '/logout', to: "sessions#destroy"
  root 'ctrl1#home'
  
  #search bar
  get 'friends/search'
  post 'friends/display'
  #get '/settings', to: "users#edit"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
