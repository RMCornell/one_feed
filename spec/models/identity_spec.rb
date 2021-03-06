require 'rails_helper'

RSpec.describe Identity, type: :model do
  let(:user_one) { User.create(email: "one@one-feed.com", sign_in_count: 1)}
  let(:identity_one) { Identity.create(user_id: user_one.id, provider: "instagram", uid: "1234", access_token: "123456", access_token_secret: "abcdef", refresh_token: nil, name: "robert", email: user_one.email, nickname: "rob", image: nil, phone: nil, urls: nil)}

  let(:user_two) { User.create(email: "two@one-feed.com", sign_in_count: 1)}
  let(:identity_two) { Identity.create(user_id: user_two.id, provider: "instagram", uid: "5678", access_token: "654321", access_token_secret: "ghijkl", refresh_token: nil, name: "robert", email: user_two.email, nickname: "rob", image: nil, phone: nil, urls: nil)}


  describe "validations" do
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
      identity_two.provider = "twitter"
      expect(identity_one).to be_valid
      expect(identity_two).to be_valid
    end

    xit 'is invalid with same uid and same provider' do
      identity_one.uid = "123"
      identity_two.uid = "123"

      expect(identity_one).to_not be_valid
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

    it 'is invalid with same access token from same provider' do
      a = identity_one
      b = identity_two
      a.uid = "5678"
      expect(a).to_not be_valid
    end

    it 'is valid with same access token secret but different provider' do
      identity_one.access_token_secret = "123"
      identity_one.provider = "instagram"
      identity_two.access_token_secret = "123"
      identity_two.provider = "instagram"

      expect(identity_one).to be_valid
      expect(identity_two).to be_valid
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

  describe "Associations" do
    it { expect(identity_one).to belong_to(:user)}
  end

  describe "Validations" do
    it { should validate_presence_of(:uid) }
    it { should validate_uniqueness_of(:uid).scoped_to(:provider)}

    it { should validate_presence_of(:provider) }
    it { should validate_presence_of(:access_token) }

    it { should allow_value(nil, "something").for(:access_token_secret) }
    it {is_expected.to validate_uniqueness_of(:access_token_secret).scoped_to(:provider).allow_blank}

    it { should allow_value(nil, "something").for(:refresh_token) }
    it { should allow_value(nil, "something").for(:email) }
    it { should allow_value(nil, "something").for(:nickname) }
    it { should allow_value(nil, "something").for(:image) }
    it { should allow_value(nil, "something").for(:phone) }
    it { should allow_value(nil, "something").for(:urls)}

    it { expect(identity_one).to have_db_column(:uid).of_type(:string) }
    it { expect(identity_one).to have_db_column(:provider).of_type(:string) }
    it { expect(identity_one).to have_db_column(:access_token).of_type(:string) }
    it { expect(identity_one).to have_db_column(:access_token_secret).of_type(:string) }
    it { expect(identity_one).to have_db_column(:refresh_token).of_type(:string) }
    it { expect(identity_one).to have_db_column(:name).of_type(:string) }
    it { expect(identity_one).to have_db_column(:email).of_type(:string) }
    it { expect(identity_one).to have_db_column(:nickname).of_type(:string) }
    it { expect(identity_one).to have_db_column(:image).of_type(:string) }
    it { expect(identity_one).to have_db_column(:phone).of_type(:string) }
    it { expect(identity_one).to have_db_column(:urls).of_type(:string) }
  end

    describe "public class methods" do
        context "self.find_for_auth" do
          xit "responds to method" do
            expect(identity_one.find_for_oauth).to have_http_response(:success)
          end
        end
      end
  end
end


