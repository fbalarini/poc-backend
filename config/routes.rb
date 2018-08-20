Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :authors do
    post 'new'
    get 'books'
    post 'add_book'
    end
  resources :books do
    post 'new'
    get 'book_pages'
    get 'book_publishDate'
  end
end
