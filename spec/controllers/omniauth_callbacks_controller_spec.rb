require 'rails_helper'

RSpec.describe OmniauthCallbacksController do
  let(:user) do
      Warden.test_mode!
      user = User.create(
          email: nil,
          sign_in_count: 1
      )
      user
    end

  it 'is valid current_user' do
    expect(user).to be_valid
  end


end


