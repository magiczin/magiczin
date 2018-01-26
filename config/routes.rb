require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'home#index' 

  resources :boosters 
  resources :sealeds 
  resources :cards
  mount Sidekiq::Web => '/sidekiq'
end
