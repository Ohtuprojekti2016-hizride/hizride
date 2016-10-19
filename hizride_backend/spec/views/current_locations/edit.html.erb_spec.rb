require 'rails_helper'

RSpec.describe "current_locations/edit", type: :view do
  before(:each) do
    @current_location = assign(:current_location, CurrentLocation.create!(
      :lat => "MyString",
      :lng => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit current_location form" do
    render

    assert_select "form[action=?][method=?]", current_location_path(@current_location), "post" do

      assert_select "input#current_location_lat[name=?]", "current_location[lat]"

      assert_select "input#current_location_lng[name=?]", "current_location[lng]"

      assert_select "input#current_location_user_id[name=?]", "current_location[user_id]"
    end
  end
end
