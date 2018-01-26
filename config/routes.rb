require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'home#index' 

  resources :boosters do
    get :export, on: :member
  end

  resources :sealeds do
    get :export, on: :member
  end

  resources :cards
  mount Sidekiq::Web => '/sidekiq'
end
