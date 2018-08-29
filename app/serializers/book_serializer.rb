class BookSerializer < ActiveModel::Serializer
    attributes :id, :name, :pages, :author_name
    #belongs_to :author

    def author_name
       object.author.name
    end

  end
