Harjutus::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts
  
  get "posts/index"
  post "posts/index"
  get "posts/show"
  post "posts/show"
  get "form/home"
  post "form/home"
  get "form/converter"
  post "form/converter"
  get "form/about"
  root 'form#home'
  require 'net/http'
  match "/signout", to: 'sessions#destroy', via: :delete

end