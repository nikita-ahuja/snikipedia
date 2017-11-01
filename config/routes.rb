Rails.application.routes.draw do
  resources :articles
  resources :photos, only: [:new, :create, :index, :destroy]
  root to: 'photos#index'

  get "home/donate", to: "home#donate"

  get 'home/index'
  root :to => "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
