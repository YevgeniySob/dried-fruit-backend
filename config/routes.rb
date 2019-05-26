Rails.application.routes.draw do
  get 'auth/create'
  resources :users, only: [:index, :show, :create]
  resources :chatrooms, only: [:index, :show, :create]
  resources :messages, only: [:create]
  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'
  mount ActionCable.server => '/cable'

end
