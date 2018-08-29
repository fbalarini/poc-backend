class BooksController < ApplicationController

  def index
      render json: author_by_id.books
  end

  def create
    book = Book.new(book_params.merge(author_id: params[:author_id]))
    if book.save
      render json: book
    else
      render json: book.errors, status: 400
    end
  end

  def show
    if book_belongs_to_author
      render json: book_by_id
    else
      render json: {status: "error", code: 3000, message: "The book doesnt belong to that author"}
    end
  end

  def update
    unless book_belongs_to_author
      render json: {status: "error", code: 3000, message: "The book doesnt belong to that author"}
      return
    end
    book_by_id.attributes = book_params
    if book_by_id.save
      render json: book_by_id
    else
      render json: book_by_id.errors, status: 400
    end
  end

  def destroy
    unless book_belongs_to_author
      render json: {status: "error", code: 3000, message: "The book doesnt belong to that author"}
      return
    end
    book_by_id.destroy
    head :ok
  end


  def all_books
    render json: Book.all
  end

  private

  def author_by_id
    @author_by_id ||= Author.find(params[:author_id])
  end

  def book_by_id
    @book_by_id ||= Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name,:pages)
  end

  def book_belongs_to_author
    book_by_id.author == author_by_id
  end

end
