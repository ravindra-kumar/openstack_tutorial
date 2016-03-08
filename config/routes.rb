Rails.application.routes.draw do
  root                'home#index'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'posts'    =>  'posts#index'
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :users
  #get '/posts/:id/:title' => 'posts#show'
  get '/posts/:id', to: 'posts#show', as: 'post'
  post 'put_comment' => 'posts#put_comment'
end
