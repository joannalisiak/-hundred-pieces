Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :legos do
    resources :bookings, only: %i[new create]
  end
    resources :bookings, only: %i[show index destroy]
end
