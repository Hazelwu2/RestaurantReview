Rails.application.routes.draw do
  devise_for :users
  root "restaurants#index"

  # 前台使用者權限
  resources :restaurants, only: [:index, :show]
  resources :categories, only: :show
  
  # 後台使用者權限
  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end

end
