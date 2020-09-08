require 'sidekiq/web'

Rails.application.routes.draw do
  resources :press_kits
  get 'services/index'
  resources :books
  resources :media_appearances
  resources :podcasts, only: [:index, :show]
  resources :meetups, only: [:index, :show]

  namespace :blog do
    resources :entries
    root to: "entries#index"
  end
  namespace :blog do
    resources :articles
  end

  namespace :admin do
      resources :users
      resources :announcements
      resources :notifications

      root to: "users#index"
    end

  # get '/blog', to: 'blog#index'
  get '/privacy', to: 'home#privacy'
  get '/podcast', to: 'podcasts#index'
  get '/events', to: 'meetups#index'
  get '/media-appearances', to: 'media_appearances#index'
  get '/press-kit', to: 'press_kits#index'
  get '/terms', to: 'home#terms'
  get '/biography', to: 'home#biography'
  get '/first-time-here', to: 'home#first_time_here'
  get '/hire-me', to: 'home#hire_me'
  get '/get-in-touch-with-me', to: 'home#contact_me'
  get '/wallpapers', to: 'home#wallpapers'

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end


  resources :notifications, only: [:index]
  resources :backstage, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
