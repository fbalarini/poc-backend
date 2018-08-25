class BooksController < ApplicationController

  def index
    if author_by_id.nil?
      render json: {status: "error", code: 3000, message: "Author doesnt exist"}
    else
      render json: author_by_id.books
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

end
