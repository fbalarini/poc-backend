# spec/controllers/authors_controller_spec.rb
require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do

	let(:hash_body) { JSON.parse(response.body) }

	before(:each) do
		@authors_with_books = create_list(:author_with_books, 3)
	end

	describe "GET #show" do
		before do
			get :show, params: {id: @authors_with_books.first.id}
		end

		let(:subject) { JSON.parse(serialize_author(@authors_with_books.first).to_json) }

		it "returns http success" do
			expect(response).to have_http_status(:success)
		end

		it "response with JSON body containing expected Author attributes" do
			expect(hash_body.keys).to match_array(["id", "name", "country", "birthDate", "book_names"])
			expect(hash_body).to match(subject)
		end
	end

	describe "GET #index" do
		before do
			get :index
		end

		let(:subject) { JSON.parse(serialize_authors(@authors_with_books).to_json) }

		it "returns http success" do
			expect(response).to have_http_status(:success)
		end

		it "response with JSON body containing expected Authors" do
			expect(hash_body).to match(subject)
		end
	end

	describe "POST #create" do
		before do
			@new_author = build(:author)
			post :create, params: {author: @new_author.attributes}
		end

		let(:subject) { JSON.parse(serialize_author(Author.find_by name: @new_author.name).to_json) }

		it "returns http success" do
			expect(response).to have_http_status(:success)
		end

		it "response with JSON body containing recently created Author" do
			expect(hash_body).to match(subject)
		end
	end

	describe "DELETE #destroy" do
		before do
			@id_to_destroy = @authors_with_books.first.id
			delete :destroy, params: {id: @id_to_destroy }
		end

		it "returns http success" do
			expect(response).to have_http_status(:success)
		end

		it "destroys the desired author" do
			expect(Author.count).to eql 2
		end

	end
end
