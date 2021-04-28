Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#home"
  resources :users
  get "users/:id/reserved_room", to: "users#reserved_room"

  resources :rooms do
    collection do
      get 'search'
    end
  end
  
  resources :reservations

  get "rooms/reservations/:id/new", to: "reservations#new"
  get "reservations/index", to: "reservations#index"
  post "reservations/:id/create", to: "reservations#create"
  post "reservations/:id/update", to: "reservations#update"
end
