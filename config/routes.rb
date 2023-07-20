Rails.application.routes.draw do
  # サイトのルートページを作成
  root to: 'homes#top'
  devise_for :users

   resources :post_images, only: [:new, :index, :show, :create,:destroy]

   get '/homes/about' =>'homes#about', as:'about'
  end
