class BookController < ApplicationController
    def create
        @book = Book.new(params.requiere(:).permit)
    end
    def destroy
    end
    def update
    end
end
