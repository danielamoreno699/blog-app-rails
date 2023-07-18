require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "returns http success and renders correct template" do
      get "/users"

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include("list users")
    end
  end

  # describe "GET /users/:id" do
  #   it "returns http success and renders correct template" do
  #     user = User.create(name: "John")
  #     get "/users/#{user.id}"

  #     expect(response).to have_http_status(:success)
  #     expect(response).to render_template(:show)
  #   end
  # end
end
