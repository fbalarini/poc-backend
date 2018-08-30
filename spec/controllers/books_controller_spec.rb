# spec/controllers/books_controller_spec.rb
require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  before(:each) do
    #@author_list = create_list(:author, 3)
    @authors_with_books = create_list(:author_with_books, 3)
    @author = @authors_with_books.first
    @book = @author.books.first
  end

	describe "GET #all_books" do
		before do
			get :all_books
		end

		let(:subject) { JSON.parse(serialize_books(Book.all).to_json) }
		let(:hash_body) { JSON.parse(response.body) }

		it "returns http success" do
			expect(response).to have_http_status(:success)
		end

		it "response with JSON body containing all the books" do
			expect(hash_body).to match(subject)
		end
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

    it "response with JSON body containing expected Book attributes" do
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

    it "response with JSON body containing expected Books" do
      expect(hash_body).to match(subject)
    end
	end

	describe "POST #create" do
    before do
      @new_book = build(:book)
      post :create, params: {author_id: @author.id, book: @new_book.attributes}
    end

    let(:subject) { JSON.parse(serialize_book(Book.find_by name: @new_book.name).to_json) }
    let(:hash_body) { JSON.parse(response.body) }
    
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "response with JSON body containing recently created Book" do
      expect(hash_body).to match(subject)
    end
	end
	
  describe "DELETE #destroy" do
		before do
      @id_to_destroy = @book.id
      delete :destroy, params: {id: @id_to_destroy, author_id: @author.id }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "destroys de desired book" do
      expect{ Book.find(@id_to_destroy) }.to raise_error(ActiveRecord::RecordNotFound)
    end

	end
	
end