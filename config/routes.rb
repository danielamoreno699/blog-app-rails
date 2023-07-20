Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


    get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'

    # get '/users/:user_id/form_post/new', to: 'posts#new', as: 'new_form_post'
    # post '/users/:user_id/form_post', to: 'posts#create', as: 'form_posts'

    get '/users/:user_id/posts/:id/form_comment/new', to: 'form_comment#new', as: 'new_form_comment'
    post '/users/:user_id/posts/:id/form_comment', to: 'form_comment#create', as: 'form_comments'

    get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
    get '/users', to: 'users#index', as: 'users'
    get '/users/:id', to: 'users#show', as: 'user'

    get '/users/:user_id/form_post/new', to: 'form_post#new', as: 'new_form_post'
    post '/users/:user_id/form_post', to: 'form_post#create', as: 'form_posts'
  # Defines the root path route ("/")
  # root "articles#index"
end
