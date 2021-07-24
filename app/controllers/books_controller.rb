class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
    @user = current_user
    @book_new = Book.new
  end

  def create
    @books = Book.all
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id

    if @book_new.save
    redirect_to book_path(@book_new), notice: 'Book was successfully created.'
    else
    @user = current_user
    render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path, alert: "errors!! you can not edit #{@book.title}"
    end

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book), notice: "title:#{@book.title} successfully."
    else
    render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully destroyed.'
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end