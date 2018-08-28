require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    let(:author) { FactoryBot.build(:author) }

    it 'should let create new ones, with appropiate data' do
      expect(author).to be_valid
    end

    it 'should not let create new ones, with empty name field' do
      author.name = nil
      expect(author).not_to be_valid
    end
  end
end
