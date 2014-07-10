Rails.application.routes.draw do
  root to: "events#index"
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :events, only: [:index, :show, :new, :create]
  end
  resources :events, only: [:index, :show, :new] do
    resources :bids, only: [:index, :show, :new, :create]
  end
  # get "welcome/landing_page", as: "landing_page"
end
