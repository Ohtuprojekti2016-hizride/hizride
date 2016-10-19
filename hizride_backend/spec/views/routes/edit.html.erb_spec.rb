require 'rails_helper'

RSpec.describe "routes/edit", type: :view do
  before(:each) do
    @route = assign(:route, Route.create!(
      :route => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit route form" do
    render

    assert_select "form[action=?][method=?]", route_path(@route), "post" do

      assert_select "input#route_route[name=?]", "route[route]"

      assert_select "input#route_user_id[name=?]", "route[user_id]"
    end
  end
end
