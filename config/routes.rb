Rails.application.routes.draw do
  devise_for :users
  mount API::Root => '/'
  
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
