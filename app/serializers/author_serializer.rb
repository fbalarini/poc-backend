class AuthorSerializer < ActiveModel::Serializer
    attributes :id, :name, :country, :birthDate, :book_names
    #has_many :books

    def book_names
        object.books.pluck(:name)
    end

  end
