Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :products do
      put :add_to_cart
    end
  end

  resources :purchases, except: [:delete]

  # get "/api/categories" => "categories#index"
  # get "/api/categories" => "api/category#show"
  namespace :api do
    resources :categories, only: [:index, :show]

    get :search, controller: "products", action: "search"
  end

  root to: "products#main"
end
