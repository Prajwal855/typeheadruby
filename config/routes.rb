Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'users', to: "users_api#index"
  post 'users/create', to: "users_api#create"
  put 'users/:id', to: "users_api#update"
  patch 'users/:id', to: "users_api#update"
  delete 'users/:id', to: "users_api#destroy"
  get 'users/:id', to: "users_api#show"
  get 'users/typehead/:search', to: "users_api#typehead"
end
