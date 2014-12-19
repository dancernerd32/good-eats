Rails.application.routes.draw do
  resources :restaurants, only: [:index, :new, :create, :show]

  root to: "restaurants#index"
end
