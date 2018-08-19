Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :authors do
    post 'new_author'
    get 'author_books'
    end
  resources :books do
    post 'new_book'
    get 'book_pages'
    get 'book_publishDate'
  end
end
