Rails.application.routes.draw do
  root to: 'rentals#index'
  
  get '/login' => 'session#new' # shows the login form. 
  post '/login' => 'session#create' #form submits to here
  delete '/login' => 'session#destroy' # logout

  post '/signup' => 'users#create' 

  resources :destinations
  resources :rentals
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
