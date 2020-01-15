Rails.application.routes.draw do

  get 'users/show'
  devise_for :users

 get 'home/index'

  devise_for :users
  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'comments/create'
  root 'home#index'
  resources :purchases
  resources :users, only: [:show]
  
  resources :courses do
    resources :comments
  end
  resources :conversations do
    resources :messages
  end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
