class UsersController < ApplicationController
  before_action :authenticate_user!

    def index
        @users = User.all
        @user = current_user
        @book_new = Book.new
    end

    def show
        @book_new = Book.new
        @user = User.find(params[:id])
        @book = @user.books
    end

    def edit
        @user = User.find(params[:id])
        if @user != current_user
        redirect_to user_path(current_user), alert: 'マイページから編集を行ってください'
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
        redirect_to user_path(current_user), notice: "You have updated user successfully."
        else
        render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
    end

end
