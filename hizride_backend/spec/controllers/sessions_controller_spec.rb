require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before do
    @user = User.create
  end

  it 'should return the role set' do
    @user.set_role('driver')
    expect(@user.get_role).to eq('driver')
  end

end
