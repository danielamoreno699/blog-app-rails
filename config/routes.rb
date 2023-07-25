Rails.application.routes.draw do
  devise_for :current_users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # get '/registrations', to: 'devise/registrations#new', as: 'new_user_registration'
  # post '/registrations', to: 'devise/registrations#create', as: 'user_registration'
    

    root 'users#index'
    get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'

    get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
    get '/users', to: 'users#index', as: 'users'
    get '/users/:id', to: 'users#show', as: 'user'

    devise_for :users, path: 'auth', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register'
    }

    get '/posts/new', to: 'posts#new', as: 'new_form_post'
    post '/posts', to: 'posts#create', as: 'form_posts'

    get '/comment/new', to: 'comment#new', as: 'new_form_comment'
    post '/comment', to: 'comment#create', as: 'form_comments'

    get '/likes/:id/create', to: 'likes#create', as: 'increment_likes'




  # Defines the root path route ("/")
  # root "articles#index"
end
