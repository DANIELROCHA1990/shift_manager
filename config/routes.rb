# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :home
  root to: 'home#index'

  namespace :shift do
    resources :users
  end
end
