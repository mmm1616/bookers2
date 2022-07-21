class UsersController < ApplicationController

  def new
    @user = User.new
    @book = Book.new
  end
  
  def index
    @users = User.all
    @user = current_user
    @books = Book.all
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  def edit
     @user = User.find(params[:id])
     
     unless @user == current_user
      redirect_to book_path(@book.id)
     end
  end

  def update
     @user = User.find(params[:id])
     
     if @user.update(user_params)
        redirect_to user_path(@user.id)
        flash[:notice] = "You have updated user successfully."
     else
        render :edit
     end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

    def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(@user.id) unless @user == current_user
    end
    
end
