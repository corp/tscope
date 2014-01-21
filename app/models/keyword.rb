class Keyword < ActiveRecord::Base
  def grab_twitts
    client = Twitter::REST::Client.new do |config|
     config.consumer_key = "ct2UMxQ6LeljhB2Zz4VDOg"
     config.consumer_secret = "h9ObYorDoqOpNl11yKLf1OMh16HZAZphXzv5PReJw"
     config.oauth_token = "14077884-1MthRU9sIrSAtxSmFP0wy1EXma9SYh56G4nAk2bwc"
     config.oauth_token_secret = "QrmNAdoqsUshHLxGGy8yuUqmHaEmUvbnO5SyrVnlM"
    end
    
    client.search(self.word, :count => 3, :result_type => "recent").take(3).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
end
