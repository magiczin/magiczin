require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'home#index' 

  resources :boosters do
    post :export, on: :member
  end

  resources :sealeds do
    post :export, on: :member
  end

  resources :cards
  mount Sidekiq::Web => '/sidekiq'
end
