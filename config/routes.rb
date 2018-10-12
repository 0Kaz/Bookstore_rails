Rails.application.routes.draw do
  root 'books#index'
  get 'about' => 'about#index'
  resources :books
  resources :authors
  resources :publishers
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
