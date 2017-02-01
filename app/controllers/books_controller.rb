class BooksController < ApplicationController
  def index
    # @books = Book.all
    @books = Book.paginate :page => params[:page], :per_page => 10
  end

  def show
    @book = Book.find params[:id]
    @comments = @book.comments.paginate :page => params[:page], :per_page => 10

  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      flash[:notice] = "#{@book.title} saved"
      redirect_to @book
    else
      render :new
    end
  end

  def edit
    @book = Book.find params[:id]
  end

  def update
    @book = Book.find params[:id]
    if @book.update_attributes(params.require(:book).permit(:title, :thoughts))
      flash[:notice] = "#{@book.title} saved"
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    book = Book.find params[:id]
    book.destroy
    flash[:notice] = "#{@book.title} deleted"
    redirect_to books_path
  end
  private

  def book_params
    params.require(:book).permit(:title, :thoughts)
  end
end
