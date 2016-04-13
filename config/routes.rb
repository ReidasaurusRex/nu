  Rails.application.routes.draw do
  
  # // About routes
  get 'about/general', as: 'about_general'
  get 'about/philosophy', as: 'about_philosophy'
  get 'about/privacy', as: 'about_privacy'
  get 'about/data', as: 'about_data'
  get 'about/future', as: 'about_future'
  # // about

  # // Access routes
  root 'access#landing'
  post 'access/login', as: 'login'
  delete 'access/logout', as: 'logout'
  # // access

  # // Site routes
  get 'site/help', as: 'site_help'
  get 'site/terms', as: 'site_terms'
  get 'site/sitemap', as: 'sitemap'
  # // site


  # // User and settings routes
  resources :users, except: :index do 
    resources :profiles, except: [:index, :destroy]
  end
  # // user and settings 

  # // Profile linked routes
  resources :profiles, except: [:index, :destroy] do
    
    scope module: 'profiles' do 
      post 'search/results', as: 'search'
      resources :notifications, only: [:index, :destroy]
      resources :stats, only: :index
      resources :challenges, only: [:index, :show]
      resources :profile_challenges, except: [:new, :destroy]
      resources :newsfeed_items, except: :new
      resources :blocked_users, only: [:index, :create, :destroy]
      resources :footprints, except: [:new, :update, :edit]

      scope module: 'settings' do 
        resources :general_settings, only: :index
        resources :sharing_settings, :privacy_settings, only: [:edit, :update]
      end # settings module

      scope module: 'follow_system' do
       resources :pending_follows, :pending_subscriptions,only: [:index, :create, :destroy]
       resources :follows, :subscriptions, only: [:index, :create, :destroy]
      end # follow_system module

    end # profile module
  end
  # // profile linked

  # // Shallow footprint routes    
  resources :footprints, except: [:new, :update, :edit], module: 'profile' do
    
    scope module: 'footprint' do 
      resources :diets, :wastes, :waters, except: :index
      resources :transportations, only: [:show, :update, :destroy]    
      resources :home_energies, except: :index
      get 'transportations', to: 'transportations#create', as: 'create_transportation'
    end # footprint module

  end
  # // shallow footprint
  



  # // Footprint component routes
  scope module: 'profile' do

    scope module: 'footprint' do 
      resources :transportations, except: [:index, :new] do
        resources :vehicles, :public_transportations, :air_travels, except: [:index, :show]
      end
      resources :home_energies, except: [:index, :new] do 
        get 'utilities', to: 'utilities#index', as: 'utilities'
        post 'utilities', to: 'utilities#update', as: 'update_utilities'
      end
    end # footprint module

  end # profile module
  # // footprint component

end
