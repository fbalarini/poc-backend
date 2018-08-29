class AuthorsController < ApiController
  def index
    render json: Author.all
  end

  def create
    author = Author.new(author_params)
    if author.save
      render json: author
    else
      render json: author.errors, status: :bad_request
    end
  end

  def show
    render json: author_by_id
  end

  def destroy
    author_by_id.destroy
    head :ok # 200 OK
  end

  def show_books
    render json: Author.find(params[:author_id]).books
  end

  def update
    if author_by_id.update(author_params)
      head :ok
    else
      render json: author.errors, status: :bad_request
    end
  end

  private

  def author_by_id
    @author_by_id ||= Author.find(params[:id]) # if variable is not null, load it with that value
  end

  def author_params
    params.require(:author).permit(:name, :country, :birthDate)
  end
end
