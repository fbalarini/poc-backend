Rails.application.routes.draw do
  namespace 'api' do
      resources :books
      resources :authors
end

end
