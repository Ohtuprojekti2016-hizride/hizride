require 'rails_helper'

RSpec.describe "current_locations/index", type: :view do
  before(:each) do
    assign(:current_locations, [
      CurrentLocation.create!(
        :lat => "Lat",
        :lng => "Lng",
        :user_id => 2
      ),
      CurrentLocation.create!(
        :lat => "Lat",
        :lng => "Lng",
        :user_id => 2
      )
    ])
  end

  it "renders a list of current_locations" do
    render
    assert_select "tr>td", :text => "Lat".to_s, :count => 2
    assert_select "tr>td", :text => "Lng".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
