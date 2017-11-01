Rails.application.routes.draw do
  resources :photos, only: [:new, :create, :index, :destroy]
  root to: 'photos#index'
  resources :users, :sessions

 get ‘signup’, to: "users#new", as: ‘signup’
 get ‘login’, to: "sessions#new", as: ‘login’
 get ‘logout’, to: "sessions#destroy", as: ‘logout’


  get 'home/index'
  root :to => "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
