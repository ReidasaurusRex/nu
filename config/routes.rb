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
  
  # # //

  # # // User and settings paths
  resources :users, except: :index do 
    resources :profiles, except: [:index, :destroy]
    resources :privacy_settings, only: [:edit, :update], module: 'completed_profile'
  end
  # # //

  # # // Profile linked paths
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
    end
    
    # # // Profile footprint routes    
    resources :footprints, except: [:new, :update, :edit], module: 'profile_matches_user' do
      scope module: 'calculator_component' do 
        resources :diet_profiles, :waste_profiles, :water_profiles, except: :index
        resources :transportation_profiles, :home_energy_profiles, except: [:index, :new, :edit]    
      end
    end
    # # //
  end
  # # //

  # # // Footprint component routes
  scope module: 'profile_matches_user' do
    scope module: 'calculator_component' do 
      resources :transportation_profiles, except: [:index, :new] do
        resources :vehicle_profiles, :public_transportation_profiles, :air_travel_profiles, except: :index
      end
      resources :home_energy_profiles, except: [:index, :new] do 
        resources :utility_profiles, except: [:index, :new, :show]
      end
    end
  end
    # # //


end
