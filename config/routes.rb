# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'user/shifts#index'

  namespace :user do
    resources :users do
      resources :shifts
    end
    resources :shifts
  end
end
