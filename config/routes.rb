Rails.application.routes.draw do
	devise_for :users
	mount API::Root => '/'

	resources :posts
	
	namespace :api, :defaults => {:format => :json} do
		as :user do
			post   "/sign-in"       => "sessions#create"
			delete "/sign-out"      => "sessions#destroy"
			get "/posts"      => "sessions#posts"
			get "/post/:post_id", to: "sessions#post"
		end
	end
end
