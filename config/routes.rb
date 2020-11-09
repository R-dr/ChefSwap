# frozen_string_literal: true

Rails.application.routes.draw do
  resources :chefs
  resources :listings

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'listings#home'
end
