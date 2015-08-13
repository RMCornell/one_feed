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

  describe "public class methods" do
    context "responds to its methods" do
      it { expect(user_one).to respond_to(:twitter) }
      it { expect(user_one).to respond_to(:twitter_client) }
      it { expect(user_one).to respond_to(:twitter_feed) }
      it { expect(user_one).to respond_to(:instagram) }
      it { expect(user_one).to respond_to(:instagram_client) }
      it { expect(user_one).to respond_to(:instagram_feed) }
      it { expect(user_one).to respond_to(:facebook) }
      it { expect(user_one).to respond_to(:facebook_client) }
      it { expect(user_one).to respond_to(:facebook_me)}
    end
  end

  describe "Associations" do
    it { expect(user_one).to have_many(:identities)}
  end

end
