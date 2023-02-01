Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "/login", to: "sessions#create"
  # namespace :auth do
  #   post "sign_up", to: "registrations#create"
  # end

  post "/signup", to: "users#create"
  post "/login", to: "session#create"
  resources :users
  resources :products
  resources :cart
  resources :cart_items
  resources :address
  
end
