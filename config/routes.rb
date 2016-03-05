Rails.application.routes.draw do
  
  # // Beta routes
  # root 'beta_users#landing'
  # get 'beta_users/new', as: 'new_beta_user'
  # post 'beta_users/create', as: 'create_beta_user'
  # get 'beta_users/thanks', as: 'thanks'
  # // beta

  # // Non beta routes

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
    resources :privacy_settings, only: [:edit, :update], module: 'completed_profile'
  end
  # // user and settings 

  # // Profile linked routes
  resources :profiles, except: [:index, :destroy] do
    scope module: 'completed_profile' do 
      post 'search/results', as: 'search'
      resources :habits, only: [:index, :show]
      resources :challenges, only: [:index, :show]
      resources :notifications, only: [:index, :destroy]
      resources :stats, only: :index
    end

    scope module: 'profile_matches_user' do 
      resources :pending_follows, :pending_subscriptions, :follows, :subscriptions, only: [:index, :create, :destroy]
      resources :completed_challenges, except: [:new, :destroy]
      resources :completed_habits, only: [:index, :create, :show]
      resources :started_challenges, :started_habits, except: [:new, :edit]
      resources :posts, except: [:index, :new]
      resources :newsfeed_items, only: [:index, :show] 
      resources :blocked_users, only: [:index, :create, :destroy]
      resources :footprints, except: [:new, :update, :edit]
    end
  end
  # // profile linked

  # // Shallow footprint routes    
  resources :footprints, except: [:new, :update, :edit], module: 'profile_matches_user' do
    scope module: 'calculator_component' do 
      resources :diets, :wastes, :waters, except: :index
      resources :transportations, :home_energies, only: [:show, :update, :destroy]    
      get 'transportations', to: 'transportations#create', as: 'create_transportation'
      get 'home_energies', to: 'home_energies#create', as: 'create_home_energy'
    end
  end
  # // shallow footprint
  



  # // Footprint component routes
  scope module: 'profile_matches_user' do
    scope module: 'calculator_component' do 
      resources :transportations, except: [:index, :new] do
        resources :vehicles, :public_transportations, :air_travel_profiles, except: :index
      end
      resources :home_energies, except: [:index, :new] do 
        resources :utilities, except: [:index, :new, :show]
      end
    end
  end
  # // footprint component

  # // non beta


end
