class BooksController < ApplicationController
    def create
        book = Book.new(book_params)
        if client.save
            #ok

    end
    def destroy
    end
    def update

    end

    private

    def book_params
        params.require(:).permit
    end
end
