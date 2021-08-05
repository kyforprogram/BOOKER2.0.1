class FavoritesController < ApplicationController
# https://qiita.com/acekame/items/6ebd0641249d9aaef8d2
# https://qiita.com/akachiryo/items/24aa3d92f7eb4396302a

  before_action :book_params

# def create
#     Favorite.create(user_id: current_user.id, book_id: params[:book_id])
# end
# def destroy
#   Favorite.find_by(user_id: current_user.id, book_id: params[:book_id]).destroy
# end


  def create
    @favorite = current_user.favorites.create(book_id: params[:book_id])
  # #   # current_user.favorites　現在のユーザーに結び付くいいねをつくる
  # #   # @favoriteにuser.idにcurrent_user.idを入れる
  # #   # book_idでいいねしたbookを入れる

  # #   # redirect_back(fallback_location: root_path)
  # #   # redirect_backは一覧画面と詳細画面でいいねをしたときに
  # #   # 一つ戻るようにして詳細画面でいいねしたときは一覧画面に戻り
  # #   # 一覧画面でいいねしたときは一覧画面に戻る
  # #   # redirect_to request.refere
  end


  def destroy
  # #   @book = Book.find(params[:book_id])
    @favorite = current_user.favorites.find_by(book_id: params[:book_id])
  # #   # @book.idがbook_idに入れる
  # #   # current_userがuser_idに入る
    @favorite.destroy
  # #   # redirect_back(fallback_location: root_path)
  # #   # fallback_locationは万が一に前のパスが見つからなかった場合は
  # #   # books_path、一覧に遷移させる
  end


  # def create
  #   @book = Book.find(params[:book_id])
  #   # @bookにbook_idを入れる
  #   favorite = current_user.favorites.new(book_id: @book.id)
  #   favorite.save
  #   # redirect_to books_path
  # end

  # def destroy
  #   @book = Book.find(params[:book_id])
  #   favorite = current_user.favorites.find_by(book_id: @book.id)
  #   favorite.destroy
  #   # redirect_to books_path
  # end

private

  def book_params
    @book = Book.find(params[:book_id])
  end
end
