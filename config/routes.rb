Rails.application.routes.draw do
  devise_for :users
  resources :reports, only: %i[new create]
  resources :blogs, only: %i[show index]

  get 'dashboard', to: 'dashboard#index'
  root 'dashboard#index'
  get 'contact', to: 'contact#show'
  get 'about_me', to: 'about_me#show'
  get 'admin/profile', to: 'admin/profiles#show'

  namespace :admin do
    resources :users, only: %i[index update edit]
    resources :blogs, except: %i[show]
    resources :profiles
    resources :reports, only: %i[index update edit destroy]
  end
end
