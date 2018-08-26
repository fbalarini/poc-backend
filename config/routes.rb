Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :authors do
    get 'show_books'
    post 'add_book'
    resources :books
  end
  resources :books, only: %i[index show]
end
