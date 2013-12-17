Harjutus::Application.routes.draw do

  resources :posts,    only: [:index, :show, :new, :create, :destroy]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get  "form/home"
  post "form/home"
  get  "form/converter"
  post "form/converter"
  get  "form/about"

  root 'form#home'

  match "/signout", to: 'sessions#destroy', via: :delete

end
