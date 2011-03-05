# == Schema Information
# Schema version: 20101122111011
#
# Table name: tweets
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  tweeted_at :datetime
#  tweet_time :datetime
#  repeat     :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Tweet < ActiveRecord::Base
    
    validates_size_of :content, :within => 1..140, :too_short => "should be at least one character!", :too_long => " can't be more than 140 characters long!"
    
    validates_date :tweet_time, :after => lambda { Date.current }
        
end
