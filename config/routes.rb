Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :services do
    resources :bookings, only: [:new, :create]
  end

  get 'services/:name', to: 'services#profile', as: 'profile'

  resources :bookings, only: [:index]

end
