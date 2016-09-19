require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.create
  end

  it 'should return a blank instance' do
    expect(@user.get_role).to eq(nil)
  end
end
