Buala::Application.routes.draw do

  get "home/index"
  root to: "home#index"
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  resources :advertisements, only: [:show]

end
