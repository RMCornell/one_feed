FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryGirl.define do
  factory :user, :class => 'User' do
    email
    password '12345678'
  end

FactoryGirl.define do
  factory :identity, :class => "Identity" do
    user_id "1"
    provider "instagram"
    uid "1234"
    access_token "4321"
    access_token_secret "5678"
    refresh_token nil
    name "robert"
    email
    nickname "rob"
    image nil
    phone nil
    urls nil
  end
end
end