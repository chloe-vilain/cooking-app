Rails.application.routes.draw do
  root 'static_pages#home'
  get '/faqs', to: 'static_pages#faqs'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  #patch '/signup' to: 'users#update'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  #Restaurant routes
  scope 'admin' do
    resources :restaurants, :recipes, :restaurant_relationships
  end
  
end
