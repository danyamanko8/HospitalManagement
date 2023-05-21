# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :doctors
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'home#index'

  resources :users, only: [:show, :edit, :update] do
    get :appointments, on: :member
  end
  resources :doctors, only: [:show, :edit, :update]
  resources :appointments, only: [:new, :create, :edit, :update]
end
