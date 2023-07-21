Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


    get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'

    get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
    get '/users', to: 'users#index', as: 'users'
    get '/users/:id', to: 'users#show', as: 'user'

    get '/form_post/new', to: 'form_post#new', as: 'new_form_post'
    post '/form_post', to: 'form_post#create', as: 'form_posts'

    get '/form_comment/new', to: 'form_comment#new', as: 'new_form_comment'
    post '/form_comment', to: 'form_comment#create', as: 'form_comments'

    post '/likes/increment/:id', to: 'likes#increment', as: 'increment_likes'


  # Defines the root path route ("/")
  # root "articles#index"
end
