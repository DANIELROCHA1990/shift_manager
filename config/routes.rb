# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  unauthenticated do
    root :to => 'home#index'
 end

  namespace :user do
    root to: 'shifts#index'
    resources :users do
      resources :shifts do
        member do
          patch 'create_user_description'
          get  'show_user_description'
          get  'new_user_description'
        end
      end
    end
    resources :shifts
  end

  namespace :admin do
    root to: 'dashboard#index'
    resources :users do
      resources :shifts
    end
  end
end
