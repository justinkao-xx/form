Harjutus::Application.routes.draw do
  get "form/home"
  post "form/home"
  get "form/converter"
  post "form/converter"
  get "form/about"
  root 'form#home'
end