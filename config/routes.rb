Rails.application.routes.draw do
  root 'sessions#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users, only: [:show]
  resources :contacts, only: [:show, :destroy, :new, :create, :edit, :update]
end
