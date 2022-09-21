# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'user/shifts#index'

  post '/users/:user_id/shifts/:id/create_description' => 'user/shifts#create_description',
       as: 'create_user_description'
  get '/users/:user_id/shifts/:id' => 'user/shifts#new_description', as: 'new_user_description'
  get '/users/:user_id/shifts/:id' => 'user/shifts#show_description', as: 'show_user_description'

  namespace :user do
    resources :users do
      resources :shifts
    end
    resources :shifts
  end

  namespace :admin do
    resources :users do
      resources :shifts
    end
  end
end
