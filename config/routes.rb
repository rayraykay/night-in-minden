Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root					   'static_pages#index'
  
  get 	'/signup'		=> 'guests#new'
  post 	'/signup'		=> 'guests#create'
  get 	'/login'		=> 'sessions#new'
  post 	'/login'		=> 'sessions#create'
  get 	'/logout'		=> 'sessions#destroy'
  
  resources :guests
end
