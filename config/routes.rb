Rails.application.routes.draw do
    resources :books

    resources :users, only: [:create]

    get "/signup" => "users#new"

    get "/login" => "sessions#new"
    post "/login" => "sessions#create"
end
