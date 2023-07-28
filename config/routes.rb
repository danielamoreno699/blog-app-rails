Rails.application.routes.draw do
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end


    devise_for :users
   
   
    root 'users#index'

    get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'

    get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
    delete '/users/:user_id/posts/:id', to: 'posts#destroy', as: 'delete_user_post'

    delete '/users/:user_id/posts/:id', to: 'comments#destroy', as: 'delete_user_comment'


    get '/users', to: 'users#index', as: 'users'
    get '/users/:id', to: 'users#show', as: 'user'

 


  get '/posts/new', to: 'posts#new', as: 'new_form_post'
  post '/posts', to: 'posts#create', as: 'form_posts'
  get '/comment/new', to: 'comment#new', as: 'new_form_comment'
  post '/comment', to: 'comment#create', as: 'form_comments'

  delete '/comment/:id', to: 'comment#destroy', as: 'delete_comment'
  get '/likes/:id/create', to: 'likes#create', as: 'increment_likes'




  # Defines the root path route ("/")
  # root "articles#index"
end
