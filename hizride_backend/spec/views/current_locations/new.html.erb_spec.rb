require 'rails_helper'

RSpec.describe "current_locations/new", type: :view do
  before(:each) do
    assign(:current_location, CurrentLocation.new(
      :lat => "MyString",
      :lng => "MyString",
      :user_id => 1
    ))
  end

  it "renders new current_location form" do
    render

    assert_select "form[action=?][method=?]", current_locations_path, "post" do

      assert_select "input#current_location_lat[name=?]", "current_location[lat]"

      assert_select "input#current_location_lng[name=?]", "current_location[lng]"

      assert_select "input#current_location_user_id[name=?]", "current_location[user_id]"
    end
  end
end
