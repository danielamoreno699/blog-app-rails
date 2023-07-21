Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


    get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'

    get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
    get '/users', to: 'users#index', as: 'users'
    get '/users/:id', to: 'users#show', as: 'user'

    get '/posts/new', to: 'posts#new', as: 'new_form_post'
    post '/posts', to: 'posts#create', as: 'form_posts'

    get '/comment/new', to: 'comment#new', as: 'new_form_comment'
    post '/comment', to: 'comment#create', as: 'form_comments'

    get '/likes/:id/create', to: 'likes#create', as: 'increment_likes'




  # Defines the root path route ("/")
  # root "articles#index"
end
