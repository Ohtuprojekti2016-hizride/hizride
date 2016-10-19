require 'rails_helper'

RSpec.describe "routes/new", type: :view do
  before(:each) do
    assign(:route, Route.new(
      :route => "MyString",
      :user_id => 1
    ))
  end

  it "renders new route form" do
    render

    assert_select "form[action=?][method=?]", routes_path, "post" do

      assert_select "input#route_route[name=?]", "route[route]"

      assert_select "input#route_user_id[name=?]", "route[user_id]"
    end
  end
end
