# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
  post '/graphql', to: 'graphql#execute'
  get 'todos/create'
  get 'todos/destroy'
  get 'home/show'
  get 'signUp' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  root to: 'home#show'
  resources :users

  resources :cards do
    resources :todos, only: [:create]
  end

  resources :todos, only: [:destroy]
  # resources :todos, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end