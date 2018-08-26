# spec/controllers/authors_controller_spec.rb
require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do

  describe "GET #show" do
    before do
      get :show, params: {id: author.id}
    end

    let(:author) { a = Author.create(name: 'Pepe', country: 'Uruguay')
                   a.books.create(name: 'Libro1', pages: 35)
                   a }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "response with JSON body containing expected Article attributes" do
      hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to match_array(["id", "name", "country", "birthDate", "book_names"])
      expect(hash_body).to match({
        id: author.id,
        name: 'Pepe', 
        country: 'Uruguay', 
        birthDate: nil,
        book_names: ["Libro1"]
      })
    end
  end
end
