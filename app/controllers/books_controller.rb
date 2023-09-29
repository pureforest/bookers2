class BooksController < ApplicationController

  def new
     @book = Book.new
  end

  def create
   @books = Book.all
   @book = Book.new(book_params)
   @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "Book was successfully created."
     redirect_to books_path
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
  end

  def edit
   @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    #book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice2] = "Book was successfully updated."
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
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

    # def user_params
    # params.require(:user).permit(:name, :profile_image)
    # end

end

