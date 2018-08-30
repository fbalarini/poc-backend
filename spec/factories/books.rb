FactoryBot.define do
  factory :book do
    author
    pages 500
    sequence(:name) { |k| "Book#{k} of #{author.name}" } # Unique name for every author
  end
end
