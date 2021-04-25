Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#home"
  resources :users
  resources :rooms do 
    get :search, on: :collection
  end
  resources :reservations
end
