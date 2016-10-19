require 'rails_helper'

RSpec.describe "CurrentLocations", type: :request do
  describe "GET /current_locations" do
    it "works! (now write some real specs)" do
      get current_locations_path
      expect(response).to have_http_status(200)
    end
  end
end
