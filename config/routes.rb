Rails.application.routes.draw do
  devise_for :users
  root "restaurants#index"

  # 前台使用者權限
  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
    collection do 
      # restaurants/feeds
      get :feeds # 顯示所有餐廳最新動態
    end

    member do
      # restaurants/:id/dashboard
      get :dashboard # 顯示個別餐廳 Dashboard
      post :favorite # 收藏餐廳
      post :unfavorite # 取消收藏餐廳
    end
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
