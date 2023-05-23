# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :doctors
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :users, only: [:show, :edit, :update] do
    get :appointments, on: :member
  end

  resources :doctors, only: [:show, :edit, :update] do
    get :appointments, on: :member
  end

  resources :appointments, only: [:new, :create, :show] do
    member do
      get :add_recommendation
      patch :attach_recommendation
    end
  end

  get 'doctors', to: 'home#doctors'
  root to: 'home#index'
end
