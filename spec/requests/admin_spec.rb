require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/admin/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/admin/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admin/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/admin/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
