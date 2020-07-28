Rails.application.routes.draw do
  get 'listing/index'
  resources :products
  resources :profiles
  devise_for :users
  root 'home#page'
  get 'about/page'
  get 'contact/page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
