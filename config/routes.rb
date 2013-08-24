Buala::Application.routes.draw do

  get "home/index"
  root to: "home#index"

  # devise_for :users

  resources :advertisements, only: [:show] do
  	member do
  		get 'apply'
      post 'apply'
      get 'thanks'
  	end
  end

  resources :users, only: [:show]
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
