# frozen_string_literal: true

Rails.application.routes.draw do
  # rails admin mounting
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'bookings/index'
 
  resources :recipies
  resources :chefs, except: :index
  resources :listings
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: 'listings#home'

  # allows bookings to have reviews
  resources :bookings do
    resources :reviews
  end
  # allows recipes to have comments
  resources :recipes do
    resources :comments
  end
  resources :payments, only: [:create]  # stripe config
  get'/payments/success', to:'payments#success'
  get'/payments/cancel',to:'payments#cancel'
  post "/payments/webhook", to: "payments#webhook"
end
