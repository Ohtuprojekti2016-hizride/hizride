require 'rails_helper'

RSpec.describe "routes/show", type: :view do
  before(:each) do
    @route = assign(:route, Route.create!(
      :route => "Route",
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Route/)
    expect(rendered).to match(/2/)
  end
end
