class Api::BooksController < ApplicationController
    
    # GET /api/books
    def index
        render json: Book.all
    end

    # POST /api/books
    def create
        @book = Book.new(book_params)
        if @book.save
            render json: @book
        else
            render json: @book.errors, status: 400
        end
    end

    # GET /api/books/:id
    def show
        render json: Book.find(params[:id])
    end

    # PUT /api/books/:id
    def update 
        Book.find(params[:id]).update(book_params)
    end

    # DELETE /api/books/:id
    def destroy
        Author.find(params[:id]).destroy
    end

    private

    def book_params
        params.require(:book).permit(:name,:content, :author_id)
    end

end