require 'rails_helper'

RSpec.describe '/users/posts', type: :request do
  let(:person1) do
    User.create(
      name: 'Lilly',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Student at Microverse.',
      post_counter: 0
    )
  end

  let(:first_post) do
    Post.create(
      author_id: person1,
      Title: 'New Post',
      Text: 'This is a new post',
      LikesCounter: 0,
      CommentsCounter: 0
    )
  end



  context 'GET /index' do
    it 'renders a list of a user\'s posts' do
      get '/users/1/posts'
      expect(response.status).to eq 200
      expect(response).to render_template 'posts/index'
      expect(response.body).to include first_post.Title
    end
  end

  context 'GET /show' do
    it 'renders a particular post for a given user' do
      get '/users/1/posts/10'
      expect(response.status).to eq 200
      expect(response).to render_template 'posts/show'
      expect(response.body).to include first_post.Title
    end
  end
end
