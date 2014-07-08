Rails.application.routes.draw do
  root "welcome#index"
  devise_for :users
  resources :events, only: [:index, :show, :new, :create]

  get "welcome/landing_page", as: "landing_page"
end
