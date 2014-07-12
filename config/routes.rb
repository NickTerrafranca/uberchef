Rails.application.routes.draw do
  root to: "events#index"
  devise_for :users

  resources :users, only: [:show, :index]

  resources :events, only: [:index, :show, :new, :create] do
    resources :bids, only: [:index, :show, :new, :create]
  # get "welcome/landing_page", as: "landing_page"
  end
end
