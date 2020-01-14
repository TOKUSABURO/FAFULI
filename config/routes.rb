Rails.application.routes.draw do

get 'home/index'

  devise_for :users
  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'comments/create'
  root 'home#index'
  resources :purchases
  resources :courses do
    resources :comments
  end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
