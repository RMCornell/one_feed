class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable

  has_many :identities

  def twitter
    identities.where(:provider => "twitter").first
  end

  def twitter_client
    @client  ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['twitter_key']
      config.consumer_secret = ENV['twitter_secret']
      config.access_token = twitter.access_token
      config.access_token_secret = twitter.access_token_secret
    end
  end

  def twitter_feed
    twitter_client.home_timeline
  end

  def instagram
    identities.where(:provider => "instagram").first
  end

  def instagram_client
    @instagram_client ||= Instagram.client(access_token: instagram.access_token)
  end

  def instagram_feed
    instagram_client.user_media_feed
  end

  def facebook
    identities.where(:provider => "facebook").first
  end

  def facebook_client
    @facebook_client ||= Facebook.client(access_token: facebook.access_token)
  end
end
