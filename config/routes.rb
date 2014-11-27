Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:index, :show] do
  	post 'send_page' => 'users#send_page' 
  end

  resources :organizations

  

  root to: 'visitors#index'
end
