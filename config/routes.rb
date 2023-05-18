# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :doctors
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  unauthenticated :user do
    root to: 'home#index'
  end

  authenticated :user do
    root to: 'appointments#index', as: :authenticated_root
  end
end
