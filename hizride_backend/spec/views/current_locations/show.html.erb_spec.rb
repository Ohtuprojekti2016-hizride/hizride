require 'rails_helper'

RSpec.describe "current_locations/show", type: :view do
  before(:each) do
    @current_location = assign(:current_location, CurrentLocation.create!(
      :lat => "Lat",
      :lng => "Lng",
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Lat/)
    expect(rendered).to match(/Lng/)
    expect(rendered).to match(/2/)
  end
end
