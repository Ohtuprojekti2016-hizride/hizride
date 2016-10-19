require 'rails_helper'

RSpec.describe "routes/index", type: :view do
  before(:each) do
    assign(:routes, [
      Route.create!(
        :route => "Route",
        :user_id => 2
      ),
      Route.create!(
        :route => "Route",
        :user_id => 2
      )
    ])
  end

  it "renders a list of routes" do
    render
    assert_select "tr>td", :text => "Route".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
