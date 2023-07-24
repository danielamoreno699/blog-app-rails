require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:person1) do
    User.create(
      name: 'Lilly',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'teacher of canada',
      post_counter: 0
    )
  end

  describe 'GET /users' do
    it 'returns http success and renders correct template' do
      get '/users'

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include person1.name
    end
  end

  describe 'GET /users/:id' do
    it 'returns http success and renders correct template' do
      get '/users/1'

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)

      expect(response.body).to include person1.name
    end
  end
end
