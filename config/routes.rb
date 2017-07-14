Rails.application.routes.draw do
  devise_for :profiles
  resources :events
  resources :profiles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'events#index'
end
