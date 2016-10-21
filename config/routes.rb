Rails.application.routes.draw do
    resources :books

    resources :users, only: [:create]

    get "/signup" => "users#new"
end
