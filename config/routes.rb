Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :courses
  root 'courses#index'
  get 'comments/create'
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
