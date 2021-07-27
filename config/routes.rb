Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get "home/about" => "homes#about"

  resources :books, except: [:new] do
  resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update]

end
