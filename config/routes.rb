Rails.application.routes.draw do
  get 'home/index'
  get 'comments/create'
  root 'home#index'
  resources :purchases
  resources :courses
  resources :home
  resources :courses do
    resources :comments
  end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
