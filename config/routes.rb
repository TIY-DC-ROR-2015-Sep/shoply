Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :products do
      put :add_to_cart
    end
  end

  resources :purchases, except: [:delete]

  root to: "products#main"
end
