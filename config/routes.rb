# frozen_string_literal: true

Rails.application.routes.draw do
  root 'articles#index'
  get 'about', to: 'static_pages#about'
  resources :articles do
    resources :comments
  end

  namespace :api do
    namespace :v1 do
      resources :articles
    end
  end
end
