class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :pages, :author_id
