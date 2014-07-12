Rails.application.routes.draw do
  root to: "events#index"
  # get "welcome/landing_page", as: "landing_page"

  devise_for :users

  resources :users, only: [:show, :index] do
    resources :messages, only: [:index, :show, :new, :create]
  end

  resources :messages, only: [:index, :show]

  resources :events, only: [:index, :show, :new, :create] do
    resources :bids, only: [:index, :show, :new, :create]
  end
end
