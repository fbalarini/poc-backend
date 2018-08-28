require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    let!(:author) { FactoryBot.create(:author) }
    let(:book) { FactoryBot.build(:book, author: author) }

    it 'should let create new ones, with appropiate data' do
      expect(book).to be_valid
    end

    it 'should not let create new ones, without existing author' do
      book = Book.create(
        name: 'The adventures of Tintin',
        pages: '150',
        publishDate: '2000-05-14'
      )
      expect(book.valid?). to be false
    end

    it 'should not let create new ones, with date after their author birth date' do
      author = Author.create(
        name: 'John',
        country: 'USA',
        birthDate: '1992-05-14'
      )
      book = Book.create(
        name: 'The adventures of Tintin',
        pages: '150',
        publishDate: '1991-05-14'
      )
      expect(book.valid?). to be false
    end
  end
end
