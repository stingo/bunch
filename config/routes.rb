Rails.application.routes.draw do
  devise_for :profiles
  resources :echocategories
  resources :echos
  resources :countries
  resources :industries
  resources :companytypes
  resources :skills
  resources :products
  resources :companies
  resources :jobs
  resources :listings
  resources :songs
  resources :urbanterms
  resources :hows
  resources :locations
  resources :events
  resources :profiles
  resources :comments
  resources :ghana, :only => [:index, :search]
  resources :main, :only => [:index, :search]
  resources :contacts, :only => [:new, :create]

  resources :tags, except: :show
  #get 'tags/:tag', to: 'ghana#search'

  #get 'tags/:tag', to: 'urbanterms#index'

  get 'tags/:tag', to: 'echos#index'

  #get '/user/:id' => 'pages#profile'

   get 'main/market' => 'main#search'






  get :search, controller: :main
  
    resources :profiles do
      
    #get :search, :on => :collection
    #get :autocomplete, :on => :collection
        member do
      put "connect", to:    "profiles#upvote"
      put "disconnect", to: "profiles#downvote"
  end
  end


      resources :urbanterms do
    #get :search, :on => :collection
    #get :autocomplete, :on => :collection
      member do
      put "like" => "urbanterms#upvote"
      put "unlike", to: "urbanterms#downvote"
  end
  end

  resources :echos do
    #get :search, :on => :collection
    #get :autocomplete, :on => :collection
    member do
      put "like", to:    "echos#upvote"
      put "dislike", to: "echos#downvote"
    end
     end

    resources :profiles, :only => [:index, :show] do
    resources :follows, :only => [:create, :destroy]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'

  #root 'ghana#index'
end
