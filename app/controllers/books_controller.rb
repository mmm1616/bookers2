class BooksController < ApplicationController
  def new 
    @book = Book.new
    @user = User.new
  end
  
  def index
    @users = User.all
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @users = User.all
    @user = current_user
    @books = Book.all
    @book = Book.find(params[:id])
  end
  
  def edit
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     @book.save
     redirect_to book_path(current_user.id)
  end
   
  def destroy
    @book = Book.find(params[:id]) 
    @book.destroy
    redirect_to books_path #indexは(id)をつける必要ない。本棚に立って本を見ている状態
  end

private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
