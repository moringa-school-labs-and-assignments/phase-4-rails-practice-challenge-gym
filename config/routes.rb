Rails.application.routes.draw do
  resources :gyms, only: [:index, :show, :destroy, :update]
  resources :clients, only: [:index, :show, :update]
  resources :memberships, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
