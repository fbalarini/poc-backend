FactoryBot.define do
  factory :author do
    birthDate "1965-07-31"
    sequence(:name) { |n| "Author#{n}" }
    sequence(:country) { |n| "Country#{n}" }
  end
end
