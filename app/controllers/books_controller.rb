class BooksController < ApplicationController
before_action :correct_user, only: [:edit, :update]

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
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
   def update
    @book = Book.find(params[:id])
    
    if  @book.update(book_params)
        redirect_to book_path(@book.id)
        flash[:notice] = "You have updated book successfully."
    else
        render :edit
    end
   end

  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     
     if @book.save
        redirect_to book_path(@book.id)
        flash[:notice] = "You have created book successfully."
     else
        @user = current_user
        @books = Book.all
        render :index
     end
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
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
  
end
