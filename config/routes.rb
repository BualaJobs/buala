Buala::Application.routes.draw do

  get "home/index"
  root to: "home#index"

  resources :companies, only: [:show] do
    resources :ads, only: [:show, :index] do
      member do
        post "seen"
        get "applications", format: :json
      end
    end
  end

  resources :advertisements, only: [:show] do
    member do
      get 'apply'
      post 'apply'
      get 'thanks'
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
