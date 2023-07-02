Rails.application.routes.draw do
  resources :birds, only: [:index, :show, :create, :update]
  
  namespace :birds do
    resources :likes, only: :update
  end
end
