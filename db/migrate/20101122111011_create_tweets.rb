class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.string :content
      t.datetime :tweeted_at
      t.datetime :tweet_time
      t.boolean :repeat

      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
