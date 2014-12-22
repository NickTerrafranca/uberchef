Rails.application.routes.draw do
  root to: 'welcome#index'

  get 'welcome/landing_page', as: 'landing_page'

  devise_for :users

  resources :users, only: [:show, :index] do
    resources :messages, except: [:edit, :update]
  end

  resources :messages, except: [:edit, :update]

  resources :events do
    resources :bids, only: [:index, :show, :new, :create]
  end
end
