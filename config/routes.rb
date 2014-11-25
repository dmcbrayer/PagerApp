Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show]

  post 'send_page' => 'users#send_page' 

  root to: 'visitors#index'
end
