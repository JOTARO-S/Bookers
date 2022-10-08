class BooksController < ApplicationController
  
  def index
    @books = Book.all
  end
  
  def new
    @book = Book.new
  end
  
  def create
    book = Book.new(books_params)
    if book.save
      flash[:notice] = "ブックが正常に作成されました。"
      redirect_to book_path(book.id)
    else
      render :index
    end
  end
  
  def show
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end
  
  def update #設定
    book = Book.find(params[:id])
    if book.update(books_params)
    redirect_to book_path(book.id)
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  def books_params
    params.permit(:title, :body)
  end
end