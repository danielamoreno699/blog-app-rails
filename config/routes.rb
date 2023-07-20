Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


    get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'

    get '/users/:user_id/posts/form_post/new', to: 'posts#new', as: 'new_form_post'
    post '/users/:user_id/posts/form_post', to: 'posts#create', as: 'form_posts'

    get '/users/:user_id/posts/form_comment/new', to: 'comments#new', as: 'new_form_comment'
    post '/users/:user_id/posts/form_comment', to: 'comments#create', as: 'form_comments'

    get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
    get '/users', to: 'users#index', as: 'users'
    get '/users/:id', to: 'users#show', as: 'user'

   
  # Defines the root path route ("/")
  # root "articles#index"
end
