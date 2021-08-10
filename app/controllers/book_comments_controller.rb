class BookCommentsController < ApplicationController
  before_action :book_params


  def create

    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comment.save
    # redirect_to book_path(@book)
    # else
    # @book_new = Book.new
    #   render 'books/show'
    # end

  end

  def destroy
    BookComment.find_by(id: params[:id]).destroy
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment, :book_id, :user_id)
  end

  def book_params
    @book = Book.find(params[:book_id])
  end

end
