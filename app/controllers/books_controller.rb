class BooksController < ApplicationController

  def index
    if author_by_id.nil?
      render json: {status: "error", code: 3000, message: "Author doesnt exist"}
    else
      render json: author_by_id.books
    end
  end

  def create
    if !author_by_id.nil?
      book = Book.new(book_params)
      book[:author_id] = params[:author_id]
      if book.save
        render json: book
      else
        render json: {status: "error", code: 3000, message: "Cannot create book"}
      end
    else
      render json: {status: "error", code: 3000, message: "Author doesnt exist"}
    end
  end

  def show
    if check_params
      return
    end
    render json: book_by_id
  end

  def update
    if check_params
      return
    end
    book = book_by_id
    book.attributes = book_params
    if book.save
      render json: book
    else
      render json: {status: "error", code: 3000, message: "Cannot update book"}
    end
  end

  def destroy
    if check_params
      return
    end
    book = book_by_id
    if book.destroy
      render json: {status: "OK", code: 200, message: "Book deleted"}
    else
      render json: {status: "error", code: 3000, message: "Cannot destroy book"}
    end
  end

  private

  def author_by_id
    if Author.exists?(params[:author_id])
      @author_by_id ||= Author.find(params[:author_id])
    else
      nil
    end
  end

  def book_by_id
    if Book.exists?(params[:id])
      @book_by_id ||= Book.find(params[:id])
    else
      nil
    end
  end

  def book_params
    params.require(:book).permit(:name,:pages)
  end

  def author_exists
    !author_by_id.nil?
  end

  def book_exists
    !book_by_id.nil?
  end

  def check_params
    if !author_exists
      render json: {status: "error", code: 3000, message: "Author doesnt exist"}
      return true
    end
    if !book_exists
      render json: {status: "error", code: 3000, message: "Book doesnt exist"}
      return true
    end
    if book_by_id.author != author_by_id
      render json: {status: "error", code: 3000, message: "The book doesnt belong to that author"}
      return true
    end
    false
  end

end
