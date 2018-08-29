# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Author.count.positive?
  Author.create(name: 'Arturo', country: 'Uruguay', birthDate: Time.current)
  Author.create(name: 'Federico', country: 'Uruguay', birthDate: Time.current)
end

unless Book.count.positive?
  Book.create(name: 'Futbol', author: Author.first)
  Book.create(name: 'Rugby', author: Author.first)
  Book.create(name: 'Basket', author: Author.second)
  Book.create(name: 'Hockey', author: Author.second)
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?