Harjutus::Application.routes.draw do
=begin
  resources :form
  root 'form#home'
=end

  get "form/home"
  post "form/home"
  get "form/converter"
  post "form/converter"
  get "form/about"
  root 'form#home'
  require 'net/http'

end