Rails.application.routes.draw do
  get 'users/show'
  get 'cards/new'
  devise_for :users
  root to: 'texts#index'
  get 'texts/:name/:id', controller: 'texts', action: 'study'
  get 'texts/search'
  resources :cards, only: [:new, :create]
  resources :users, only: [:show, :update]
end
