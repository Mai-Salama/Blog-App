Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/login", to: "sessions#login"
  post "/signup", to: "sessions#signup"
  post "/logout", to: "sessions#logout"
  post "/create_blog", to: "blogs#create"
  post "/edit_blog", to: "blogs#edit"
  post "/delete_blog", to: "blogs#delete"
  post "/create_comment", to: "comments#create"
  post "/edit_comment", to: "comments#edit"
  post "/delete_comment", to: "comments#delete"
  post "/create_tag", to: "tags#create"
  post "/delete_tag", to: "tags#delete"
end
