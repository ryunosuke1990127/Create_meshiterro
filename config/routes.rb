Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  # サイトのルートページを作成
  root to: 'homes#top'
  devise_for :users
    
    # post_image_controller用のルーティング
   resources :post_images, only: [:new, :index, :show, :create,:destroy]
   
    # users_controller用のルーティング
    resources :users, only: [:show, :edit]
   
   get '/homes/about' =>'homes#about', as:'about'
  end
