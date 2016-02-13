Rails.application.routes.draw do
  
  # // Beta routes
  # root 'beta_users#new'
  # post 'beta_users/create', as: 'create_beta_user'
  # get 'beta_users/thanks', as: 'thanks'
  # //

  # // Non beta routes

  # // About routes
  get 'about/general', as: 'about_general'
  get 'about/philosophy', as: 'about_philosophy'
  get 'about/privacy', as: 'about_privacy'
  get 'about/data', as: 'about_data'
  get 'about/future', as: 'about_future'
  # # //

  # // Acess routes
  root 'access#landing'
  post 'access/login', as: 'login'
  delete 'access/logout', as: 'logout'
  # # //

  # # // Site routes
  get 'site/help', as: 'site_help'
  get 'site/terms', as: 'site_terms'
  get 'site/sitemap', as: 'sitemap'
  # # //

  # # // Search results
  post 'search/results', as: 'search'
  # # //

  # # // User and settings paths
  resources :users, except: :index do 
    resources :profiles, except: [:index, :destroy]
    resources :privacy_settings, only: [:edit, :update], module: 'completed_profile'
  end
  # # //

  # # // Profile linked paths
  resources :profiles, except: [:index, :destroy] do
    resources :pending_followers, :pending_followings, :followers, :followings, only: [:index, :create, :destroy]
    resources :emissions_profiles, except: [:new, :update, :edit]
    # post 'emissions_profiles/create', as: 'create_emissions_profile'
    resources :completed_challenges, except: [:new, :destroy]
    resources :completed_habits, only: [:index, :create, :show]
    resources :habits, only: [:index, :show]
    resources :started_challenges, :started_habits, except: [:new, :edit]
    resources :notifications, only: [:index, :destroy]
    resources :posts, except: [:index, :new]
    resources :newsfeed_items, only: [:index, :show]
    resources :stats, only: :index
    resources :blocked_users, only: [:index, :create, :destroy]
  end
  # # //

  # # // Carbon calculator routes
  resources :emissions_profiles, except: [:new, :update, :edit] do 
    resources :diet_profiles, :waste_profiles, :water_profiles, except: :index
    resources :transportation_profiles, :home_energy_profiles, except: [:index, :new]
  end

  resources :transportation_profiles, except: [:index, :new] do
    resources :vehicle_profiles, :public_transportation_profiles, :air_travel_profiles, except: :index
  end

  resources :home_energy_profiles, except: [:index, :new] do 
    resources :utility_profiles, except: [:index, :new, :show]
  end
  # # //


end
