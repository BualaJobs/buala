Buala::Application.routes.draw do

  # get "home/index"
  # root to: "home#index"
<<<<<<< HEAD

  # devise_for :users

  resources :advertisements, only: [:show] do
  	member do
  		get 'apply'
  	end
  end

  resources :users, only: [:show]
=======
>>>>>>> Bugfix i18n, Removing not used routes (pre-alpha)
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

<<<<<<< HEAD
=======
  # devise_for :users

  resources :advertisements, only: [:show]

>>>>>>> Bugfix i18n, Removing not used routes (pre-alpha)
end
