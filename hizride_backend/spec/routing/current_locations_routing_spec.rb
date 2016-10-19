require "rails_helper"

RSpec.describe CurrentLocationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/current_locations").to route_to("current_locations#index")
    end

    it "routes to #new" do
      expect(:get => "/current_locations/new").to route_to("current_locations#new")
    end

    it "routes to #show" do
      expect(:get => "/current_locations/1").to route_to("current_locations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/current_locations/1/edit").to route_to("current_locations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/current_locations").to route_to("current_locations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/current_locations/1").to route_to("current_locations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/current_locations/1").to route_to("current_locations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/current_locations/1").to route_to("current_locations#destroy", :id => "1")
    end

  end
end
