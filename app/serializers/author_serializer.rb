class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :birthday

  def birthday
    object[:birthDate]
  end
end
