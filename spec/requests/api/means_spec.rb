require 'rails_helper'

RSpec.describe "Api::Means", type: :request do
  describe "GET /display" do
    it "returns http success" do
      get "/api/means/display"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /post" do
    it "returns http success" do
      get "/api/means/post"
      expect(response).to have_http_status(:success)
    end
  end

end
