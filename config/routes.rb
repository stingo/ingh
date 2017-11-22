Rails.application.routes.draw do

  get 'comments/create'

  devise_for :profiles
  resources :profiles
  resources :comments
  resources :main
  resources :hows
  resources :urban_terms
  resources :results
  resources :tags, except: :show

  resources :handlers, :only => [:index]

  get :search, controller: :main

  resources :tags, except: :show
  get 'tags/:tag', to: 'main#index'
  get 'tags/:tag', to: 'urban_terms#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Link the URL to the search controller's `index` action
  #post '/:q' => 'results#index'

  resources :urban_terms do
    #get :search, :on => :collection
    #get :autocomplete, :on => :collection
    member do
      put "like", to:    "urban_terms#upvote"
      put "dislike", to: "urban_terms#downvote"
    end
  end

  resources :hows do
    #get :search, :on => :collection
    #get :autocomplete, :on => :collection
    member do
      put "like", to:    "hows#upvote"
      put "dislike", to: "hows#downvote"
    end
  end

  resources :profiles, :only => [:index, :show] do
    resources :follows, :only => [:create, :destroy]
  end

  #root 'urban_terms#index'
  root to: "main#index"



end





