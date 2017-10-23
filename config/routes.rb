Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root					   'static_pages#index'
  
  get 	'/signup'			=> 'guests#new'
  post 	'/signup'			=> 'guests#create'
  get	'/guest_list'		=> 'guests#index'
  
  get 	'/login'			=> 'sessions#new'
  post 	'/login'			=> 'sessions#create'
  get 	'/logout'			=> 'sessions#destroy'
  
  get 	'/table_selection' 	=> 'tables#selection'
  post 	'/table_selection'	=> 'tables#select_table'
  get	'/table_list'		=> 'tables#index'
  
  get	'/admin_login'		=> 'admin_sessions#new'
  post 	'/admin_login'		=> 'admin_sessions#create'
  get	'/admin_logout'		=> 'admin_sessions#destroy'
  
  resources :guests
end
