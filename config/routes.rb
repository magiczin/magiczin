require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'home#index'
  mount Sidekiq::Web => '/sidekiq'

  resources :boosters do
    post :export, on: :member
  end

  resources :sealeds do
    post :export, on: :member
  end

  resources :cards

  get 'auth/google', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
