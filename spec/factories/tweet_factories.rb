# This will guess the Tweet class

  Factory.define( :tweet ) do |p|
    p.content( :content )
    p.tweet_time( :tweet_time )
    p.repeat ( :repeat )
  end
  