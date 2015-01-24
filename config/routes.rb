Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :goals do
    resources :cheers, only: [:create, :destroy]
  end
  resources :comments, except: [:show, :index]
end
