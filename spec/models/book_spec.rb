require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    let!(:author) { FactoryBot.create(:author) }
    let(:book) { FactoryBot.build(:book, author: author) }

    it 'should let create new ones, with appropiate data' do
      expect(book).to be_valid
    end

    it 'should not let create new ones, without existing author' do
      book.author = nil
      expect(book).not_to be_valid
    end
  end
end
