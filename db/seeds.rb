# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

author = Author.create({name: "Juan"})
author3 = Author.create({name: "Nando"})
author3.books.create({name: "El primero", content: "asdfsjdfksjdnvksjfjnsdfkjsdnfsdnfjksdnfkasd"})