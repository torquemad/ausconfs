Rails.application.routes.draw do
  resources :conferences
	root "pages#home"
  
end
