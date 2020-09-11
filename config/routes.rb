Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :collections
      resources :users
      get '/persist', to:'users#persist'
    end
  end
  post 'api/v1/login', to: 'api/v1/users#login'
  patch 'api/v1/collections/:id', to: 'api/v1/collections#update'
end
