Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "hello#index"
  get '/show', to: 'hello#show'
end
