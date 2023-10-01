class BooksController < ApplicationController
 before_action :is_matching_login_user, only: [:edit, :update]
 
  def new
     @book = Book.new
  end

  def create
   @books = Book.all
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   @user = current_user
    if @book.save
     flash[:notice] = "Book was successfully created."
     redirect_to book_path(@book)
    else
     render :index
    end
  end

  def index
   @books = Book.all
    @book = Book.new
    @user = current_user
    # @post_images = @user.post_images.
  end

  def show
   @book = Book.new
   @find_book = Book.find(params[:id])
   @user = @find_book.user
  end

  def edit
   @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    #book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice2] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:alert] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private

   def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
   end

  private
    def book_params
     params.require(:book).permit(:title, :body)
    end
    
    def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
      redirect_to books_path
    end
    end

    # def user_params
    # params.require(:user).permit(:name, :profile_image)
    # end

end

