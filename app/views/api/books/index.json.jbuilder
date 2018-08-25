json.array! @books do |book|
    json.id book.id
    json.title book.name
    json.text book.content
    json.author do
        json.name book.author.name
    end
end