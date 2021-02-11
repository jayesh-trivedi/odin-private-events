Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'events#index'
  resources :users, only: [:show, :new, :create]
  resources :sessions, only: [:create, :new, :destroy]
  resources :events, only: [:new, :create, :show, :index] do
    get :attend, on: :member
end
end
