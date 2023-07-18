require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    Rails.application.routes.draw do
      get '/users', to: 'users#index', as: 'users'
      get '/users/:id', to: 'users#show', as: 'user'
    end
  end

  describe "GET/index" do
    it "returns http success and renders correct template" do
      get :index

      #p response.body

      expect(response).to be_successful
      expect(response).to render_template(:index)
      
      # expect(response.body).to include("list users")
    end
   end

   describe "GET/show" do
    it "returns http success and renders correct template" do
      get :show, params: { id: 1 }

      p response.body
      expect(response).to be_successful
      expect(response).to render_template(:show)
    end
   end
end
