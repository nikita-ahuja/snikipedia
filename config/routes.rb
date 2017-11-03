Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  # resources :photos, only: [:new, :create, :index, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'profile/:id', to: 'users#show', as: 'profile'
  get 'tags/:tag', to: 'articles#index', as: :tag

  # get "/users/signup", controller: "users", action: "signup"
  # get "/users/login", controller: "users", action: "login"
  # post "/users/profile", controller: "users", action: "profile"

  get "home/donate", to: "home#donate"

  get 'home/index'
  root :to => "home#index"

  resources :articles, :categories, :charges, :photos, :sessions, :users

end
