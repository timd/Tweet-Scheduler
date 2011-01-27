require 'spec_helper'

describe Tweet do

  before do
    @tweet = Factory.create(:tweet)
  end

  describe( "structure" ) do
    subject{ @tweet }
    # it { should have_many( :games ).dependent( :destroy ) }
    it { should have_a( :content ) }
    it { should have_a( :tweet_time ) }
    it { should have_a( :repeat ) }
  end
  
end
