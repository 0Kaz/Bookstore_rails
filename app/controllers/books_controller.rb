class BooksController < ApplicationController
  before_action :set_book_id, only: [:edit, :show, :update, :destroy]

  def index
    @books = Book.all
    @categories = Category.all
  end

  def new
    @page_title = "Add a new Book"
    @book = Book.new
    @category = Category.new
    @author = Author.new
    @publisher = Publisher.new
  end

  def create
    @book = Book.create(set_book_params)
    if @book.save
      flash[:notice] = "Book created"
      redirect_to books_path
    else
      render :new
    end
  end

  def update
    @book.update(set_book_params)
    flash[:notice] = "Book edited"
    redirect_to books_path
  end

  def edit
    @page_title = "Edit book"
  end

  def destroy
    @book.destroy
    flash[:notice] = "Book removed"
    redirect_to books_path
  end

  def show
    @categories = Category.all

  end

  private

  def set_book_params
    params.require(:book).permit(:title, :category_id, :author_id, :publisher_id, :isbn, :price, :buy, :format, :excerpt , :pages, :year, :coverpath )
  end

  def set_book_id
    @book = Book.find(params[:id])
  end

end
