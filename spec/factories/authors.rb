FactoryBot.define do
  factory :author do
    birthDate "1965-07-31"
    sequence(:name) { |n| "Author#{n}" }
    sequence(:country) { |n| "Country#{n}" }

    factory :author_with_books do
      transient do
        books_count 10
      end

      after(:create) do |author, evaluator|
        create_list(:book, evaluator.books_count, author: author)
      end
    end
  end
end
