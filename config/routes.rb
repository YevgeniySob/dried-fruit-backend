Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create]
  resources :chatrooms, only: [:index, :show, :create]
  resources :messages, only: [:create]
  mount ActionCable.server => '/cable'
end
