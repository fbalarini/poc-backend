FactoryBot.define do
  factory :book do
    name { Faker::Name.name }
    pages { Faker::Number.number(2) }
    publishDate '2000-05-14'
    author nil
  end
end
