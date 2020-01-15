Rails.application.routes.draw do
  #devise_for :users
  resources :courses
  root 'courses#index'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
}

  get 'users/show'
 get 'home/index'

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
