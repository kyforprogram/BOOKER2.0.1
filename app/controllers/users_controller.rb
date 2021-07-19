class UsersController < ApplicationController
    resources :users, only: [:index,:show,:edit,:update,]

  def index
  
  end

  def show
  
  end

  def edit
  
  end
  
  def update

  end



end
