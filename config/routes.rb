require 'sidekiq/web'

Rails.application.routes.draw do
  resources :boosters do
    resources :cards
  end

  resource :sealed
  mount Sidekiq::Web => '/sidekiq'
end
