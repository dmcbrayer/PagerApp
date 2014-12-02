Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:index, :show] do
  	resources :messages, only: [:new, :create]
  end

  resources :organizations

  

  root to: 'visitors#index'
end
