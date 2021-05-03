Rails.application.routes.draw do
  devise_for :users
  root to: 'texts#index'
  get 'texts/:name/:id', controller: 'texts', action: 'study'
  get 'texts/search'
end
