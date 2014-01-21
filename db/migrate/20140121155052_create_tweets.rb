class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text  
      t.string :user_uid
      t.string :user_name
      t.string :user_screen_name
      t.string :user_image_url
      t.string :tweet_id
      t.datetime :tweet_created_at
      t.references :keyword
      t.timestamps
    end
  end
end
