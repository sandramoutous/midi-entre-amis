Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :categories
  resources :cuisines
  resources :restaurants do
    get :search, on: :collection
  end
end
