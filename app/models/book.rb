class Book < ApplicationRecord
    belongs_to :author
    validates :name , presence: true
    validates_associated :authors
    
end
