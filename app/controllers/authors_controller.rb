class AuthorsController < ApiController

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
    render json: author_by_id
  end

  def update
    author_by_id.attributes = authors_params
    if author_by_id.save
      render json: author_by_id
    else
      render json: author_by_id.errors, status: 400
    end
  end

  def destroy
    author_by_id.destroy
    head :ok
  end
  
  private

  def authors_params
    params.require(:author).permit(:name,:country,:birthDate)
  end

  def author_by_id
      @author_by_id ||= Author.find(params[:id])
  end
end
