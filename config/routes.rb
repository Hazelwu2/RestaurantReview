Rails.application.routes.draw do
  devise_for :users
  root "restaurants#index"

  # 前台使用者權限
  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
  end
  resources :categories, only: :show
  resources :users, only: [:show, :edit, :update]
  
  # 後台使用者權限
  namespace :admin do
    resources :restaurants do
      resources :comments
    end
    resources :categories
    root "restaurants#index"
  end

end
