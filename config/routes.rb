Harjutus::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  
  get "posts/new"
  get "form/home"
  post "form/home"
  get "form/converter"
  post "form/converter"
  get "form/about"
  root 'form#home'
  require 'net/http'
  match "/signout", to: 'sessions#destroy', via: :delete
  match "/posts", to: 'posts#destroy', via: :delete
  
  resources :posts

end