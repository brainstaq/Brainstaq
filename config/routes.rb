require "sidekiq/web"

Rails.application.routes.draw do
  mount Intro::Engine => "/intro"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :follows
  resources :subscribers, only: [:create, :new, :index]
  root to: "home#index"
  
  resources :conversations do
    resources :messages
  end

  resources :donations

  resources :contact, only: [:create]

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => {
    registrations: 'registrations',
    confirmations: 'confirmations'
  }
  
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :ideas, only: [:show, :index, :new, :create, :edit, :update, :destroy] do
    resources :comments
    
    member do
      put 'like', to: "ideas#like"
      put 'unlike', to: "ideas#unlike"
    end
  end

  post '/tinymce_assets' => 'tinymce_assets#create'
  # post "follow/user" => "users#follow_user", as: :follow_user

  post '/users/:username/follow', to: "users#follow", as: "follow_user"
  post '/users/:username/unfollow', to: "users#unfollow", as: "unfollow_user"
  
  # get 'user/followers', to: "users#followers", as: "user_followers"
  # get 'user/followees', to: "users#followees", as: "user_followees"

  #get '/moon', to: 'application#moon', as: 'moon'
  #get '/sun', to: 'application#sun', as: 'sun'

  get 'pages/about'
  get 'pages/career'
  get 'pages/help'
  get 'pages/terms' 
  get 'pages/privacy'

  get 'search' => 'search#index'

  get 'profile/:username' => 'users#profile', as: :profile

  get '/dashboard' => 'users#index'

  # Routes for blog
  # match '/blog',        to: 'blog_posts#index', as: :blog_posts, via: :get
  # match '/blog/:title', to: 'blog_posts#show', as: :blog_post, via: :get

  resources :users, only: [:profile] do
    get :ideas
  end
  
  resources :users do
    member do
      get 'followings' => 'follows#following'
      get 'followers' => 'follows#follower'
    end
  end

  # post '/:donation/pstk_webhook' => 'webhooks#receive', as: :receive_webhooks
  post 'donations/receive_webhooks', to: 'donations#receive'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
