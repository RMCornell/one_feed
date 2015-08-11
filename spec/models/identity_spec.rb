require 'rails_helper'

RSpec.describe Identity, type: :model do
  let(:identity) do
    Identity.new(
                  user_id: 1,
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

    it 'is valid' do
      expect(identity).to be_valid
    end

    it 'is invalid without a uid' do
      identity.uid = nil
      expect(identity).to_not be_valid
    end

    it 'is invalid without a provider' do
      identity.provider = nil
      expect(identity).to_not be_valid
    end

    it 'is invalid without an access token' do
      identity.access_token = nil
      expect(identity).to_not be_valid
    end

    it 'is invalid without an access token secret' do
      identity.access_token_secret = nil
      expect(identity).to_not be_valid
    end

    xit 'is valid with same uid but different provider'do
      #write test verifying that two identites can exist with same uid but different providers
    end

    xit 'is invalid with same uid and same provider' do
      #test verifying that same identities cannot have same uid and same provider
    end

    xit 'is valid with same access token but different provider' do
      #test verifying that two identites can exist with same access token from different providers
    end

    xit 'is invalid with same access token from same provider' do
      #Test that identies cannot have same access token from same provider
    end

    xit 'is valid with same access token secret but different provider' do
      #Test verifying two identies can exist with same access token secret from different providers
    end

    xit 'is invalid with same access token secret from same provider' do
      #test verifying two identies cannot have same access token secret from same provider
    end

    xit 'is valid with or without a refresh token (google auth column)' do
      #test verifying that with a refresh token idenity is still valid
    end

    it 'is valid without a name' do
      identity.name = nil
      expect(identity).to be_valid
    end

    it 'is valid without a nickname' do
      identity.nickname = nil
      expect(identity).to be_valid
    end

    it 'is valid without a phone' do
      identity.phone = nil
      expect(identity).to be_valid
    end

    it 'is valid without an image' do
      identity.image = nil
      expect(identity).to be_valid
    end

    it 'is valid without urls' do
      identity.urls = nil
      expect(identity).to be_valid
    end
  end
