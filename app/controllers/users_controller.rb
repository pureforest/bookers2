class UsersController < ApplicationController
  def show
    @user = current_user
    @books = Book.all
    @book = Book.new
    #@book2 = Book.find(params[:id])
  end

  def index
    @users = User.all
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to "/users/:id"
  end

private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end

