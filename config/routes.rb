Rails.application.routes.draw do
  resources :boosters do
    resources :cards
  end
  resource :sealed
end
