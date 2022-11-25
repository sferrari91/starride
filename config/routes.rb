Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get :dashboard, to: "pages#dashboard"
  resources :spaceships do
    resources :bookings, only: %i[show new create]
  end
  resources :bookings, only: %i[index edit update destroy]
  patch 'accept_booking/:id', to: 'bookings#accept_booking', as: 'accept_booking'
  patch 'decline_booking/:id', to: 'bookings#decline_booking', as: 'decline_booking'
end
