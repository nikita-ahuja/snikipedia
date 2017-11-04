Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  # resources :photos, only: [:new, :create, :index, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'profile/:id', to: 'users#show', as: 'profile'
  # get 'tags/:tag', to: 'articles#index', as: :tag

  # resources :articles do
  #   collection do
  #     get :search, :action => 'search', :as => 'search'
  #     # get 'search/:q', :action => 'search', :as => 'search'
  #   end
  # end

  # #==== Filter Pages Start=========
  # get 'article/search' => 'articles#search'

  # #==== Search Pages Start=========
  # post 'search_articles' => 'search#search_articles'

  # get 'search_articles', to: 'search#search_articles', as: 'search_articles'

  get 'search_articles', to: 'articles#search', as: 'search_articles'

  post 'selected_form_options' => 'articles#selected_form_options'






  # post 'search_result_page_indexer' => 'search#search_result_indexer'





  # get "articles/search", to: "articles#search"



  # get "/users/signup", controller: "users", action: "signup"
  # get "/users/login", controller: "users", action: "login"
  # post "/users/profile", controller: "users", action: "profile"

  get "home/donate", to: "home#donate"


  get 'home/index'
  root :to => "home#index"

  resources :articles, :categories, :charges, :photos, :sessions, :tags, :users

end
