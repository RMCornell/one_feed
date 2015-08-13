require 'rails_helper'

RSpec.describe OmniauthCallbacksController do
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

  let(:user) { User.create(email: nil, sign_in_count: 1)}
  let(:identity) { Identity.create(user_id: user.id, provider: "instagram", uid: "1234", access_token: "123456", access_token_secret: "abcdef", refresh_token: nil, name: "robert", email: user.email, nickname: "rob", image: nil, phone: nil, urls: nil)}

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

    xit 'does something with omniauth' do
      expect(:get => '/users/auth/').to route_to('omniauth_callbacks#passthru', {:provider=>/instagram|twitter|facebook/})
    end
  end

  describe 'user creation' do
    it 'creates a new user' do
      session[:user_id] = user.id

    end
  end

  # feature 'testing oauth' do
  #   scenario 'should create a new tiger' do
  #     login_with_oauth
  #     visit new_tiger_path
  #
  #     fill_in 'tiger_name', :with => 'Charlie'
  #     fill_in 'tiger_blood', :with => 'yes'
  #
  #     click_on 'Create Tiger'
  #
  #     page.should have_http_response(:success)
  #   end
  # end

end


