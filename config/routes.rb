Rewards::Engine.routes.draw do
  root 'home#index'

  resources :bestowments, only: %i[new create]
end
