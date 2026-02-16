Rails.application.routes.draw do
  resources :offices
  resources :employees
  resources :office_employees
end
