class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
      if @book.save
        flash[:notice] = "Book was successfully created"
        redirect_to book_path(@book)
      else
        flash.now[:error] = @book.errors.full_messages
        render :index
      end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed"
    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "Book was successfully updated"
      redirect_to book_path(@book)
    else
      render :edit
    end

  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
