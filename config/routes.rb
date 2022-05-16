# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#index'
  get 'about', to: 'static_pages#about'
  resources :articles
end
