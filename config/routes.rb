Rails.application.routes.draw do
  resources :birds, only: [:index, :show, :create, :update]
  
  #The route for updating likes is:
  #PATCH /birds/likes/:id
  #The body should be empty.
  namespace :birds do
    resources :likes, only: :update
  end
end
