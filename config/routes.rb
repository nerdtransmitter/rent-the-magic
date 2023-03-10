Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "dashboard", to: "pages#dashboard"
  # delete "costumes/:id", to: "costumes#destroy", as: :delete
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :costumes do
    resources :bookings, except: [:destroy]
  end
  resources :bookings, only: [] do
    member do
      post :approve
    end
  end

  resources :bookings, only: [:destroy, :edit, :update, :show]
end
