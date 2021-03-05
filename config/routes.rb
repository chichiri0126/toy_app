Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get 'static_pages/home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]

  get '/threads'                            => 'user_threads#list',   as: 'thread_list'
  get '/users/:user_id/threads/new'         => 'user_threads#new',    as: 'thread_new'
  get '/users/:user_id/threads/:thread_id'  => 'user_threads#get',    as: 'thread_get'
  post '/users/:user_id/threads'            => 'user_threads#create', as: 'thread_create'

  post '/users/:user_id/comment'               => 'user_comments#create', as: 'comment_create'
  delete '/users/:user_id/comment/:comment_id' => 'user_comments#delete', as: 'comment_delete'
end
