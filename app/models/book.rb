class Book < ApplicationRecord
  belongs_to :author
  validates :name, :author, presence: true
end
