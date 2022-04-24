Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :users do
    get :wishlist, on: :member
  end
  resources :categories
  resources :cuisines
  resources :restaurants do
    get :search, on: :collection
  end
  resources :user_restaurants
end
