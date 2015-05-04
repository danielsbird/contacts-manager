Rails.application.routes.draw do
  root 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users, only: [:show]
  resources :contacts, only: [:show, :destroy]
end
