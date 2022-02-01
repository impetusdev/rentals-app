Rails.application.routes.draw do
  get 'session/new' => 'session#new '
  post 'session/create' => 'session#create'
  delete 'session/destroy' => 'session#destroy'
  
  resources :destinations
  resources :rentals
  # resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
