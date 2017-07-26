Rails.application.routes.draw do
  resources :hows
  resources :locations
  devise_for :profiles
  resources :events
  resources :profiles
  resources :ghana, :only => [:index, :search]

  get :search, controller: :ghana
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'ghana#index'
end
