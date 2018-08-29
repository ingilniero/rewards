Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  mount Rewards::Engine => "/rewards"
end
