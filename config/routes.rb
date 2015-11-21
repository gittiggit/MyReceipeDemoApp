Rails.application.routes.draw do
  
  root "pages#home"
  get "pages/home"
  
  resources :receipes do
      member do
        post 'like'
      end
  end
  
  
  
  
end
