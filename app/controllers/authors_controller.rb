class AuthorsController < ApplicationController
    def create
        author = Author.new(author_params)
        if author.save
            render json: {
                status: 200,
                message: "Successfully created new author."
            }.to_json
        else:
            render json: {
                status: 500,
                message: "Internal issues, try later."
            }.to_json
        end
    end
    def show
        author = Author.find(params[:id])
    end
    def destroy
        author.find(params[:id]).destroy
    end
    def show_books:
        author = Author.find(params[:id])
        authors_books = "author.books"
        render json: {
            status: 200,
            message: authors_books
        }.to_json
    end
    def add_book:


    private

    def author_params
        params.require(:).permit
    end

end
