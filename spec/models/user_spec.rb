require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_one) do
    User.create(
        email: nil,
        sign_in_count: 1,
    )
  end

  let(:identity_one) do
    Identity.create(
        user_id: user_one.id,
        provider: "instagram",
        uid: "1234",
        access_token: "abc123",
        access_token_secret: "secret",
        refresh_token: nil,
        name: "robert",
        email: 'robert@rob.com',
        nickname: 'robc',
        phone: '1234567890',
        urls: "urls"
    )
  end

  xit {expect(identity_one).to validate_presence_of(:user_id)}
  it {expect(identity_one).to validate_presence_of(:uid)}
  it {expect(identity_one).to validate_presence_of(:provider)}
  it {expect(identity_one).to validate_presence_of(:access_token)}

  it {expect(identity_one).to belong_to(:user)}

  describe "twitter" do
    context "responds to twitter" do
      it { expect(user_one).to respond_to(:twitter) }
      it { expect(user_one).to respond_to(:twitter_client)}
      it { expect(user_one).to respond_to(:twitter_feed)}
      it { expect(user_one).to respond_to(:instagram)}
      it { expect(user_one).to respond_to(:instagram_client)}
      it { expect(user_one).to respond_to(:instagram_feed)}
      it { expect(user_one).to respond_to(:facebook)}
      it { expect(user_one).to respond_to(:facebook_client)}
    end
  end





  end
