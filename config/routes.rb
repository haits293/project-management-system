Rails.application.routes.draw do
  resources :admins
  resources :users
  root "home#index"
  get "login" => "sessions#new"
  get "admin-login" => "admin_sessions#new"
end
