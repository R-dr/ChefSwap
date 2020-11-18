# frozen_string_literal: true

Rails.application.routes.draw do
  get 'bookings/index'
 
  resources :recipies
  resources :chefs, except: :index
  resources :listings
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: 'listings#home'
  resources :bookings do
    resources :reviews
  end
  
  resources :recipes do
    resources :comments
  end
  resources :payments, only: [:create]
  get'/payments/success', to:'payments#success'
  get'/payments/cancel',to:'payments#cancel'
  post "/payments/webhook", to: "payments#webhook"
end
