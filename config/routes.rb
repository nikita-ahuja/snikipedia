Rails.application.routes.draw do
  resources :articles
  resources :photos, only: [:new, :create, :index, :destroy]
  root to: 'photos#index'


  get "/users/signup", controller: "users", action: "signup"
  get "/users/login", controller: "users", action: "login"
  post "/users/profile", controller: "users", action: "profile"
  resources :users


  get "home/donate", to: "home#donate"


  get 'home/index'
  root :to => "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
