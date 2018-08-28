FactoryBot.define do
  factory :author do
    name { Faker::Name.name }
    country 'USA'
    birthDate '1992-05-14'
  end
end
