class Keyword < ActiveRecord::Base
  has_many :tweets
  
  def grab_twitts
    client = Twitter::REST::Client.new do |config|
     config.consumer_key = "ct2UMxQ6LeljhB2Zz4VDOg"
     config.consumer_secret = "h9ObYorDoqOpNl11yKLf1OMh16HZAZphXzv5PReJw"
     config.oauth_token = "14077884-1MthRU9sIrSAtxSmFP0wy1EXma9SYh56G4nAk2bwc"
     config.oauth_token_secret = "QrmNAdoqsUshHLxGGy8yuUqmHaEmUvbnO5SyrVnlM"
    end
    
    client.search(self.word, :count => 10, :result_type => "recent").take(10).collect do |tweet|
      new_tweet = Tweet.new
      
      new_tweet.tweet_id=tweet.id.to_s
      new_tweet.tweet_created_at=tweet.created_at
      new_tweet.text = tweet.text
      
      new_tweet.user_uid= tweet.user.id
      new_tweet.user_name=tweet.user.name
      new_tweet.user_screen_name=tweet.user.screen_name
      #new_tweet.user_image_url=tweet.user.profile_image_url
      
      new_tweet.keyword=self
      
      new_tweet.save
    end
  end
end
