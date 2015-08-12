require 'rails_helper'

RSpec.describe Identity, type: :model do
  let(:user_one) do
    User.create(
                email: nil,
                sign_in_count: 1,
                )
  end

  let(:user_two) do
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

  let(:identity_two) do
    Identity.create(
                    user_id: user_two.id,
                    provider: "instagram",
                    uid: "5678",
                    access_token: "cba321",
                    access_token: "terces",
                    refresh_token: nil,
                    name: "The Doctor",
                    email: "rob@robert.com",
                    nickname: 'robertc',
                    phone: "0987654321",
                    urls: "urls urls"
                    )
  end

    it 'is valid' do
      expect(identity_one).to be_valid
      expect(identity_two).to be_valid
    end

    it 'is invalid without a uid' do
      identity_one.uid = nil
      expect(identity_one).to_not be_valid
      expect(identity_two).to be_valid
    end

    it 'is invalid without a provider' do
      identity_one.provider = nil
      expect(identity_one).to_not be_valid
      expect(identity_two).to be_valid
    end

    it 'is invalid without an access token' do
      identity_one.access_token = nil
      expect(identity_one).to_not be_valid
      expect(identity_two).to be_valid
    end

    it 'is valid without an access token secret' do
      identity_one.access_token_secret = nil
      expect(identity_one).to be_valid
    end

    it 'is valid with same uid but different provider'do
      identity_one.uid = 123
      identity_two.uid = 123
      expect(identity_one).to be_valid
      expect(identity_two).to be_valid
    end

    xit 'is invalid with same uid and same provider' do
      identity_one.uid = 123
      identity_one.provider = "instagram"
      identity_two.uid = 123
      identity_two.provider = "instagram"

      expect(identity_one).to be_valid
      expect(identity_two).to_not be_valid
    end

    it 'is valid with same access token but different provider' do
      identity_one.access_token = "123"
      identity_one.provider = "instagram"
      identity_two.access_token = "123"
      identity_two.provider = "twitter"

      expect(identity_one).to be_valid
      expect(identity_two).to be_valid
    end

    xit 'is invalid with same access token from same provider' do
      #Test that identies cannot have same access token from same provider
    end

    it 'is valid with same access token secret but different provider' do
      identity_one.access_token_secret = "123"
      identity_one.provider = "instagram"
      identity_two.access_token_secret = "123"
      identity_two.provider = "instagram"

      expect(identity_one).to be_valid
      expect(identity_two).to be_valid
    end

    xit 'is invalid with same access token secret from same provider' do
      #test verifying two identies cannot have same access token secret from same provider
    end

    it 'is valid with or without a refresh token (google auth column)' do
      identity_one.refresh_token = nil
      identity_two.refresh_token = "123"

      expect(identity_one).to be_valid
      expect(identity_two).to be_valid
    end

    it 'is valid without a name' do
      identity_one.name = nil
      expect(identity_one).to be_valid
    end

    it 'is valid without a nickname' do
      identity_one.nickname = nil
      expect(identity_one).to be_valid
    end

    it 'is valid without a phone' do
      identity_one.phone = nil
      expect(identity_one).to be_valid
    end

    it 'is valid without an image' do
      identity_one.image = nil
      expect(identity_one).to be_valid
    end

    it 'is valid without urls' do
      identity_one.urls = nil
      expect(identity_one).to be_valid
    end

end
