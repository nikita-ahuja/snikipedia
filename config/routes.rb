Rails.application.routes.draw do
  resources :photos, only: [:new, :create, :index, :destroy]
  root to: 'photos#index'
  resources :users

  get "/users/signup", controller: "users", action: "signup"
  get "/users/login", controller: "users", action: "login"


  get 'home/index'
  root :to => "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
