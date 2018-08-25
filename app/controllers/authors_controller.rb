class AuthorsController < ApplicationController

  def index
    authors = Author.all
    render json: authors
  end

  def create
    author = Author.new(authors_params)
    if author.save
      render json: author
    else
      render json: author.errors, status: 400
    end
  end

  def show
    if author_by_id.nil?
      render json: {status: "error", code: 3000, message: "Author doesnt exists"}
    else
      render json: author_by_id
    end
  end

  def update
    author = author_by_id
    if author.nil?
      render json: {status: "error", code: 3000, message: "Author doesnt exists"}
    else
      author.attributes = authors_params
      if author.save
        render json: author
      else
        render json: {status: "error", code: 3000, message: "Cannot update author"}
      end
    end
  end

  def destroy
    author = author_by_id
    if author.nil?
      render json: {status: "error", code: 3000, message: "Author doesnt exists"}
    else
      if author.destroy
        render json: {status: "OK", code: 200, message: "Author deleted"}
      else
        render json: {status: "error", code: 3000, message: "Cannot destroy author"}
      end
    end
  end
  private

  def authors_params
    params.require(:author).permit(:name,:country,:birthDate)
  end

  def author_by_id
    if Author.exists?(params[:id])
      @author_by_id ||= Author.find(params[:id])
    else
      nil
    end
  end
end
