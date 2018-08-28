require 'rails_helper'

RSpec.describe Author, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
  describe Author do
    context 'When creating new authors' do
      it 'should let create new ones, with appropiate data' do
        author = Author.create(
          name: 'John',
          country: 'USA',
          birthDate: '1992-05-14'
        )
        expect(author.valid?).to be true
      end
      it 'should not let create new ones, with empty name field' do
        author = Author.create(
          country: 'USA',
          birthDate: '1992-05-14'
        )
        expect(author.valid?).to be false
      end
    end
  end
end
