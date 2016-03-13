Rails.application.routes.draw do
  resources :admins
  resources :users
  root "home#index"
end
