# spec/controllers/authors_controller_spec.rb
require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do

  before(:each) do
    #@author_list = create_list(:author, 3)
    @authors_with_books = create_list(:author_with_books, 3)
  end

  describe "GET #show" do
    before do
      get :show, params: {id: @authors_with_books.first.id}
    end

    let(:subject) { JSON.parse(serialize_author(@authors_with_books.first).to_json) }
    let(:hash_body) { JSON.parse(response.body) }

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
    let(:hash_body) { JSON.parse(response.body) }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "response with JSON body containing expected Authors" do
      byebug
      expect(hash_body).to match(subject)
    end
  end

end
