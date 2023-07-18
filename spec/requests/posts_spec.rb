require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /users/:user_id/posts" do
    it "returns http success and renders correct template and displays placeholder" do
      get "/users/1/posts"

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include("Here is the List of posts associated with User account")
    end
  end
end
