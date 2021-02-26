Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :legos do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[show edit update index destroy] do
    resources :reviews, only: %i[new create show]
  end
    resources :reviews, only: %i[destroy]
end
