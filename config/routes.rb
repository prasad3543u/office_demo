Rails.application.routes.draw do
  post "/register", to: "auth#register"
  post "/login", to: "auth#login"

  resources :projects do
    resources :tasks
  end
   resources :tags
end
