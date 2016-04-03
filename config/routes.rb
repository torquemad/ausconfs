Rails.application.routes.draw do


  root "pages#home"
  get '/home', to: 'pages#home'
  
  resources :conferences
  resources :users, except: [:new, :index]

  get '/register', to: 'users#new'

  
end
