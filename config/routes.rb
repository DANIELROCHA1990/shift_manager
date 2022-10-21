# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  namespace :user do
    root to: 'user/shifts#index'
    resources :users do
      resources :shifts
    end
    resources :shifts
  end

  namespace :admin do
    root to: 'admins#dashboard'
    get '/show/:id' => 'admin/admins#show'
    resources :admins
  end
end
