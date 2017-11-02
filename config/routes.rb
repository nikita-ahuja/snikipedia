Rails.application.routes.draw do

  # resources :photos, only: [:new, :create, :index, :destroy]

  get "/users/signup", controller: "users", action: "signup"
  get "/users/login", controller: "users", action: "login"
  post "/users/profile", controller: "users", action: "profile"
  post "/users/logout", controller: "users", action: "logout"

  get "home/donate", to: "home#donate"

  get 'home/index'
  root :to => "home#index"

  resources :articles, :categories, :photos, :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
