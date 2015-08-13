require 'rails_helper'

RSpec.describe OmniauthCallbacksController, :type => :controller do
  describe "anonoymous user" do
    before :each do
      login_with nil
    end

    xit 'should redirect to signin' do
        expect(:get => "welcome/index").to route_to(root_path)
    end

    xit 'should let a user see something' do
      login_with FactoryGirl.create(:user)
      get :index
      expect(response).to route_to(new_user_session_path)
    end

  end

  def login_with_oauth(service = :twitter)
    visit "users/auth/#{service}"
  end

  Capybara.default_host = 'http://example.org'

  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:twitter, {
                                       :uid => '12345',
                                       :nickname => 'zapnap',
                                       :token => "1234"

                                   })

  let(:user) { FactoryGirl.create(:user) }
  let(:identity) { FactoryGirl.create(:identity) }

  it 'is valid current_user' do
    expect(user).to be_valid
  end

  describe "routes" do
    it 'renders the index' do
      expect(:get => "/").to route_to("welcome#index")
    end

    it 'renders the user session' do
      expect(:get => new_user_session_path).to route_to("devise/sessions#new")
    end

    it 'renders the post for user session' do
      expect(:get => user_session_path).to route_to("devise/sessions#new")
    end
  end

  describe 'user creation' do
    it 'creates a new user' do
      session[:user_id] = user.id
    end
  end
end