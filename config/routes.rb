Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :products do
      put :add_to_cart
    end
  end

  resources :purchases, except: [:delete]

  # get "/api/categories" => "categories#index"
  namespace :api do
    resources :categories, only: [:index]
  end

  root to: "products#main"
end
