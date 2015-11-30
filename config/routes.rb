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
    resources :purchases, only: [:index, :send_reminder]

    get :search, controller: "products", action: "search"

    root "base#who_am_i"
  end

  get :search, controller: "products", action: "search"
  post "/purchases/:id" => "purchases#pay"

  root to: "products#main"
end
