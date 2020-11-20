Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  root to: 'pages#home'

    resources :pokemons, only: [:index, :new, :show, :create, :update, :edit, :destroy ] do
      resources :bookings, only: [:new, :create, :show]
    end

    resources :bookings, only: :destroy

    resources :bookings, only: [:new, :create, :show, :destroy] do
      resources :reviews, only: [:new, :create]
    end

    resources :reviews, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :show
end
