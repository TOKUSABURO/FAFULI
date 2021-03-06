Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'steps/index'
  get 'about_us/index'

  resources :courses
  devise_for :users, controllers: {

    registrations: "users/registrations",
    # Add this
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

  resources :about_us do
    resources :about_us
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
