Rails.application.routes.draw do


  resources :courses
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
}

  get 'users/show'
 get 'home/index'
  resources :courses
  resources :charges
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
