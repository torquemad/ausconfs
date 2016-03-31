Rails.application.routes.draw do

  resources :conferences

  root "pages#home"

  get '/home', to: 'pages#home'

  get '/conferences', to: 'conferences#index'
  get '/conferences/new', to: 'conferences#new'
  post '/conferences', to: 'conferences#create'
  get '/conferences/:id/edit', to: 'conferences#edit'
  patch '/conferences/:id', to: 'conferences#update'
  get 'conferences/:id', to: 'conferences#show'
  delete '/conferences/:id', to: 'conferences#destroy'
  
end
