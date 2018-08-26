class BooksController < ApiControllerController
    def index
        render json: Book.all
    end

    def create
        book = Book.new(book_params)
        if book.save
            render json: book
        else
            render json: book.errors, status: 400
        end
    end

    def show
        render json: book_by_id
    end

    def destroy
        book_by_id.destroy
        head :ok
    end

    def update
        if book_by_id.update_attributes(book_params)
            head :ok
        else
            render json: book.errors, status: 400
    end

    private

    def book_by_id
        @book_by_id ||= Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:name, :author_id)
    end

end
