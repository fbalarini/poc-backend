class BooksController < ApplicationController
    def create
        book = Book.new(book_params)
        if book.save
            render json: {
                status: 200,
                message: "Successfully created new book."
            }.to_json
        else:
            render json: {
                status: 500,
                message: "Internal issues, try later."
            }.to_json
        end
    end
    def show
        book = Book.find(params[:id])
    end
    def destroy
        book.find(params[:id]).destroy
    end

    private

    def book_params
        params.require(:).permit
    end
end
