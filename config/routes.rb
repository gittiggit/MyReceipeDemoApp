Rails.application.routes.draw do
  
  root "pages#home"
  get "pages/home"
  
  resources :receipes
  
end
