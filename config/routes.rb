Buala::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  ActiveAdmin.routes(self)

  get "home/index"
  root to: "home#index"
end
