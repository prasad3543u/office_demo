Rails.application.routes.draw do

 post '/login', to: 'auth#login'
  resources :offices
  resources :employees
  resources :office_employees
end
