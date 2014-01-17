Harjutus::Application.routes.draw do

  resources :posts,    only: [:index, :show, :new, :create, :destroy]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
<<<<<<< HEAD
  resources :movies
  resources :shows
  resources :reviews
  
  get "posts/new"
  get "form/home"
=======

  get  "form/home"
>>>>>>> 3e832ac2bc58a9aca92e50176671bb35000eb3df
  post "form/home"
  get  "form/converter"
  post "form/converter"
  get  "form/about"

  root 'form#home'
<<<<<<< HEAD
  require 'net/http'
=======

>>>>>>> 3e832ac2bc58a9aca92e50176671bb35000eb3df
  match "/signout", to: 'sessions#destroy', via: :delete

end
