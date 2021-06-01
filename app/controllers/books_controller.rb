class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @books = Book.all.order(id: :asc)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @books = Book.all.order(id: :asc)
    @book = Book.new(book_params)
    if @book.save
       flash[:notice] = 'Book was successfully created.'
       redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def edit
    @books = Book.all.order(id: :asc)
    @book = Book.find(params[:id])
  end

  def update
    @books = Book.all.order(id: :asc)
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
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

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
