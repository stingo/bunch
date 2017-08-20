Rails.application.routes.draw do
  resources :songs
  resources :urbanterms
  resources :hows
  resources :locations
  devise_for :profiles
  resources :events
  resources :profiles
  resources :ghana, :only => [:index, :search]

  get :search, controller: :ghana
  
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
      put "like", to:    "urbanterms#upvote"
      put "unlike", to: "urbanterms#downvote"
  end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'ghana#index'
end
