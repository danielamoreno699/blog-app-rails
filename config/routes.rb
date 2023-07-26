Rails.application.routes.draw do
  root 'users#index'

  namespace :users do
    resources :posts, only: [:index, :show]
    # Other user-related routes can go here
  end

  resources :users, only: [:index, :show]

  get '/posts/new', to: 'posts#new', as: 'new_form_post'
  post '/posts', to: 'posts#create', as: 'form_posts'
  get '/comment/new', to: 'comment#new', as: 'new_form_comment'
  post '/comment', to: 'comment#create', as: 'form_comments'
  get '/likes/:id/create', to: 'likes#create', as: 'increment_likes'

  # Customizing Devise paths
  devise_for :users, path: 'auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'register'
  }, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # Other routes...
end
