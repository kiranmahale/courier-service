Rails.application.routes.draw do
  resources :orders
  devise_for :admins
  root to: 'orders#index'
end
