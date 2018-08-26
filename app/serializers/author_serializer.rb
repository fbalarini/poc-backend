class AuthorSerializer < ActiveModel::Serializer
    attributes :id, :name, :country, :birthDate, :book_names
    #has_many :books

    def book_names
        res = []
        object.books.each do |book|
            res.push(book.name)
        end
        res
    end

  end
