# spec/controllers/books_controller_spec.rb
require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  before(:each) do
    #@author_list = create_list(:author, 3)
    @authors_with_books = create_list(:author_with_books, 3)
    @author = @authors_with_books.first
    @book = @author.books.first
  end

  describe "GET #show" do
    before do
  		get :show, params: {author_id: @author.id, id: @book.id}
    end

    let(:subject) { JSON.parse(serialize_book(@book).to_json) }
    let(:hash_body) { JSON.parse(response.body) }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "response with JSON body containing expected Author attributes" do
      expect(hash_body.keys).to match_array(["id", "author_name", "name", "pages"])
      expect(hash_body).to match(subject)
    end
  end
  describe "GET #index" do
    before do
      get :index, params: {author_id: @author.id}
    end

    let(:subject) { JSON.parse(serialize_books(@author.books).to_json) }
    let(:hash_body) { JSON.parse(response.body) }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "response with JSON body containing expected Authors" do
      expect(hash_body).to match(subject)
    end
	end
	
end