Rails.application.routes.draw do
  get 'destinations/new'
  get 'destinations/create'
  get 'destinations/index'
  get 'destinations/show'
  get 'destinations/edit'
  get 'destinations/update'
  get 'destinations/destroy'
  resources :rentals
  # resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
