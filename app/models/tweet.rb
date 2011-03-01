class Tweet < ActiveRecord::Base
    
    validates_size_of :content, :within => 1..140, :too_short => "should be at least one character!", :too_long => " can't be more than 140 characters long!"

end
