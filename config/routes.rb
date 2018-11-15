Rails.application.routes.draw do
  root "static_pages#index"
  get "users/my_song", to: "users#my_song"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "signup", to: "users#new"
  post "signup", to: "users#create"
  resources :users, except: :destroy
  resources :password_resets, except: %i(index show destroy)
  resources :account_activations, only: :edit
  resources :songs
  namespace :admin do
    get "/", to: "dashboards#index"
    resources :categories
  end
end
