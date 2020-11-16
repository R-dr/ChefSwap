# frozen_string_literal: true

Rails.application.routes.draw do
  get 'bookings/index'
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/edit'
  get 'recipes/update'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :chefs
  resources :listings
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: 'listings#home'
  
  
  resources :recipes do
    resources :comments
  end
  resources :payments, only: [:create]
  get'/payments/success', to:'payments#success'
  get'/payments/cancel',to:'payments#cancel'
  post "/payments/webhook", to: "payments#webhook"
end
