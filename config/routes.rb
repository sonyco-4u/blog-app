Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show] do
        resources :posts, only: [:index, :show] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end

  devise_for :users
  root to: "users#index"
  get '/users/:user_id/posts', to: 'posts#index', as: 'post_path'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'post_show'
  post '/users/:user_id/posts/:id/comments', to: 'comments#create', as: 'comment_create'
  get '/users/:user_id/posts/:id/comments/new', to: 'comments#new', as: 'comment_new'
  post '/users/:user_id/posts/:id/likes', to: 'likes#create', as: 'like_create'
  get '/users/:user_id/posts/:id/likes/new', to: 'likes#new', as: 'like_new'
  
  resources :users, only: [:index, :show]

  resources :comments, only: [:new, :create, :destroy]

  resources :posts, only: [:new, :create, :destroy]
end
