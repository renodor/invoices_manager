# frozen_string_literal:true

Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  resources :clients, only: %i[edit update index]
  resources :invoices do
    resources :line_items
    member do
      get :edit_client
      patch :update_client
    end
  end
end
