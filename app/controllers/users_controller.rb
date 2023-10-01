class UsersController < ApplicationController
before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    #@book2 = Book.find(params[:id])
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = 'Your user info has been successfully updated.'
       redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "Profile was not successfully update."
      render :edit
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    user_id = params[:id].to_i
      unless user_id == current_user.id
        redirect_to user_path(current_user)
      end
  end

end

