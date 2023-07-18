require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    Rails.application.routes.draw do
      get '/users', to: 'users#index', as: 'users'
    end
  end

  describe "GET index" do
    it "returns http success and renders correct template" do
      get :index

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end
end
