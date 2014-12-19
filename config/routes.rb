Rails.application.routes.draw do
  resources :restaurants, only: [:index, :new, :create]
end
