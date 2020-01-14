Rails.application.routes.draw do
  get 'comments/create'
  resources :purchases
  resources :courses
  
  resources :courses do
    resources :comments
  end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
