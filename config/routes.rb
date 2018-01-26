require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'home#index' 
  resources :boosters do
    resources :cards
  end

  resource :sealed
  mount Sidekiq::Web => '/sidekiq'
end
