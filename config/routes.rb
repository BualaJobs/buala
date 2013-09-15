Buala::Application.routes.draw do

  scope 'api' do
    defaults format: :json do
      api_version(:module => "V1", :path => {:value => "v1"}) do
        resources :advertisements, only: [:show] do
          resources :applications, except: [:delete]
        end
      end
    end
  end

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
