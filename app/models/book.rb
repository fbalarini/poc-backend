class Book < ApplicationRecord
    belongs_to :author

    validates :name, presence: true
    validates :content, presence:true

end
