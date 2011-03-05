require 'spec_helper'

describe Tweet do

  before do
    @tweet = Factory.create(:tweet, :content => "Foo", :tweet_time => Time.utc(2011,12,1,10,11,12))
  end

  describe( "structure" ) do
    subject{ @tweet }
    # it { should have_many( :games ).dependent( :destroy ) }
    it { should have_a( :content ) }
    it { should have_a( :tweet_time ) }
    it { should have_a( :repeat ) }
  end
  
  describe "tweet content" do
  
    it "should not allow tweet content greater than 140 characters" do
    
      long_content = "a" * 141
    
      long_content_tweet = Tweet.new(:content => long_content)
      long_content_tweet.should_not be_valid

    end
  
    it "should not allow tweet content of less than 1 character" do
      short_content_tweet = Tweet.new(:content => "")
      short_content_tweet.should_not be_valid
    end

  end
  
  describe "times" do
    
    it "should not allow tweet times in the past" do
      
      past_time = Time.now - 1.day
      past_tweet = Tweet.new(:content => "foo", :tweet_time => past_time)
      past_tweet.should_not be_valid
      
    end
    
    it "should allow tweet times in the future" do
      future_time = Time.now + 1.day
      future_tweet = Tweet.new(:content => "foo", :tweet_time => future_time)
      future_tweet.should be_valid
    end
    
  end
end
