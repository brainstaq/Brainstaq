require "sidekiq/web"

Rails.application.routes.draw do

  root to: "home#index"
  
  resources :donors
  mount Intro::Engine => "/intro" #brainstaq.com/intro/admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :follows
  resources :subscribers, only: [:create, :new, :index]
  
  resources :conversations do
    resources :messages
  end
  
  resources :donations
  # resources :contact, only: [:new, :create]
  
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => {
    registrations: 'registrations',
    confirmations: 'confirmations',
    omniauth_callbacks: 'omniauth_callbacks'
  }
  
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  
  resources :enterprises, :path => 'brands', only: [:show, :index, :new, :create, :edit, :update, :destroy] do
    resources :business_plans
    resources :pitch_decks
    resources :team_members
    resources :services
    resources :portfolios
    resources :products
    resources :invoices
  end

  # resources :subs do
  #   member do
  #     get 'activate_sub'
  #     get 'deactivate_sub'
  #   end
  # end

  resources :ideas, :path => 'projects', only: [:show, :index, :new, :create, :edit, :update, :destroy] do
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

  get '/about' => 'pages#about'
  # get '/pricing' => 'plan_subscription#new'
  get '/career' => 'pages#career'
  get '/faqs' => 'pages#faqs'
  get '/all_features' => 'pages#features'
  get '/how_it_works' => 'pages#how_it_works'
  get '/contact' => 'pages#contact'
  get '/help' => 'pages#help'
  # get '/plans' => 'pages#plans'
  get '/terms' => 'pages#terms'
  get '/privacy' => 'pages#privacy'

  get 'search' => 'search#index'

  get 'profile/:username' => 'users#profile', as: :profile

  get 'dashboard/:full_name' => 'users#index', as: :dashboard

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

  # resources :retracts
  # resources :transactions
  # resources :transactions do
  #   member do
  #     get 'details'
  #   end
  # end
  
  # post 'web' => "retracts#web"
  # get 'callback' => "transactions#callback"
  # get 'upgrade' => "transactions#upgrade"  

  # get 'plan_subscriptions/success'
  # get 'transactions/success'

  post 'paystack/receive_webhooks', to: 'paystack#webhook'

end