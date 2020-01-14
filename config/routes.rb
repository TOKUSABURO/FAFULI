Rails.application.routes.draw do
  devise_for :users
  resources :courses
  root 'courses#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'comments/create'
  resources :purchases
 
  resources :courses do
    resources :comments
  end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
