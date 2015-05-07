Rails.application.routes.draw do
  root 'contacts#index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  resources :contacts
end
