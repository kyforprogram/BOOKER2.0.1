Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get "home/about" => "homes#about"

  resources :books, except: [:new] do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
  # ——————————————— ここから ———————————————
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  # ——————————— ここまでネストさせる ———————————
  end
  get 'search' => "search#search"
end
