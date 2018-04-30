require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'home#index'
  mount Sidekiq::Web => '/sidekiq'
  resources :decks do
    post :search
    get :card_types
    get :mana_curve
  end
  resources :drafts
  resources :lobbies

  resources :boosters do
    post :export, on: :member
  end

  resources :sealeds do
    post :export, on: :member
  end

  resources :cards

  get 'auth/google', to: redirect('/auth/google_oauth2')
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
