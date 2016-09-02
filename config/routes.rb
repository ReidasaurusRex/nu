  Rails.application.routes.draw do
  
  # About routes
  get 'about/general', as: 'about_general'
  get 'about/philosophy', as: 'about_philosophy'
  get 'about/privacy', as: 'about_privacy'
  get 'about/data', as: 'about_data'
  get 'about/future', as: 'about_future'
  # about

  get 'browser_req/no_js', as: 'no_js'

  # Blog routes
  resources :blog_posts, only: [:index, :show]
  # blog

  # Feedback routes
  get 'feedback/new', as: 'new_feedback'
  post 'feedback/create', as: 'create_feedback'
  get 'feedback/thanks', as: 'feedback_thanks'
  # feedback

  # Access routes
  root 'access#landing'
  post 'access/login', as: 'login'
  delete 'access/logout', as: 'logout'
  # access

  # User and settings routes
  resources :users, except: :index do 
    resources :profiles, except: [:index, :destroy]
  end

  get '/users/:id/edit_password', to: 'users#edit_password', as: 'user_edit_password'
  post '/users/:id/update_password', to: 'users#update_password', as: 'user_update_password'
  # user and settings 

  # Profile linked routes
  resources :profiles, except: [:index, :destroy] do  
    scope module: 'profiles' do 
      get 'site/help', as: 'site_help'
      get 'site/terms', as: 'site_terms'
      get 'site/sitemap', as: 'sitemap'
      post 'search/results', as: 'search'
      resources :notifications, only: [:index, :destroy]
      resources :stats, only: :index
      resources :challenges, only: [:index, :show]
      resources :newsfeed_items, except: :new
      resources :profile_blocked_profiles, only: [:index, :create, :destroy]
      resources :footprints, except: [:new, :update, :edit]
      resources :feeds, only: :create
      resources :profile_feeds, except: [:edit, :update, :new]
      scope module: 'settings' do 
        resources :general_settings, only: :index
        resources :sharing_settings, :privacy_settings, only: [:edit, :update]
      end # settings module
      scope module: 'follow_system' do
       resources :pending_follows, :pending_subscriptions, only: [:index, :create, :destroy]
       resources :follows, :subscriptions, only: [:index, :create, :destroy]
      end # follow_system module
      scope module: 'challenges' do 
        resources :profile_started_challenges, only: [:index, :create, :show]
        resources :profile_completed_challenges, except: [:new, :create, :destroy]
      end
    end # profile module
  end
  # profile linked

  # Shallow footprint routes    
  resources :footprints, except: [:new, :update, :edit], module: 'profiles' do 
    scope module: 'footprints' do 
      resources :diets, :wastes, :waters, except: :index
      resources :transportations, only: [:show, :update, :destroy]    
      resources :home_energies, except: :index
      get 'transportations', to: 'transportations#create', as: 'create_transportation'
    end # footprint module
  end
  # shallow footprint
  
  # Newsfeed routes
  resources :newsfeed_items, except: :new, module: 'profiles' do 
    resources :likes, only: [:index, :create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  # newsfeed 

  # Feed entries routes
  resources :profile_feeds, module: 'profiles' do 
      scope module: 'profile_feeds' do 
        resources :entries, only: :index
      end # profile_feed module
  end
  # feed entries

  # Footprint component routes
  scope module: 'profiles' do
    scope module: 'footprints' do 
      resources :transportations, only: [:show, :update, :destroy] do
        resources :vehicles, :public_transportations, :air_travels, except: [:index, :show]
      end
      resources :home_energies, except: :index do 
        get 'utilities', to: 'utilities#index', as: 'utilities'
        post 'utilities', to: 'utilities#update', as: 'update_utilities'
      end
    end # footprint module
  end # profile module
  # footprint component

  # Started challenge updates routes
  scope module: 'profiles' do 
    scope module: 'challenges' do
      resources :profile_started_challenges, only: [:index, :create, :show] do 
        resources :profile_completed_challenges, only: [:new, :create]
        resources :started_challenge_updates, only: [:new, :create]
      end
    end # challenges module
  end # profiles module
  # started challenge updates
end
