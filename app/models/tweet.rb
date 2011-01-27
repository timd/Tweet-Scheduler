class Tweet < ActiveRecord::Base
    
    validates_size_of :tweet, :within => 1..140, :too_short => "Don't write blank tweets!", :too_long => "Tweets can't be more than 140 characters long!"

end
