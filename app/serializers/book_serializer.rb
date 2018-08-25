class BookSerializer < ActiveModel::Serializer
    attributes :id, :name, :content
    belongs_to :author
end 