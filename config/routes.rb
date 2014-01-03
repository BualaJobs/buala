Buala::Application.routes.draw do

  resources :full_postulations

  get "directives/applyBox"
  get "directives/modal"

  devise_for :users, controllers: {registrations: :registrations}

  resources :users, only: [] do
    collection do
      get 'me'
      put 'me', to: 'users#update'
      # This actions are used for migrating old users to devise users
      get 'migrate', to: 'users#migrate'
      put 'migrate', to: 'users#define_password'
    end
  end

  scope 'api' do
    defaults format: :json do
      api_version(:module => "V1", :path => {:value => "v1"}) do
    resources :companies
      resources :advertisements, only: [:show] do
        resources :applications, except: [:delete]
        resources :postulations, except: [:delete] do
          member do
            get :resume
          end
        end
      end
      end
    end
  end

  get 'home/index'
  root to: 'home#index'
  
  get 'empresas', to: 'home#business'
  post 'empresas', to: 'home#business_contact'

  resources :companies, only: [:show] do
    resources :ads, only: [:show, :index] do
      member do
        post 'seen'
        get 'applications', format: :json
      end
    end
  end

  resources :advertisements, only: [:show] do
    member do
      get 'apply'
      post 'apply'
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
