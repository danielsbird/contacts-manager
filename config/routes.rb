Rails.application.routes.draw do
  resources :users, only: [:show]
  resources :contacts, only: [:show, :destroy]
end
