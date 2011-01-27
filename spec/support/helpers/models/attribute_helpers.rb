module ModelHelpers
  
  class HaveCollection

    def description
      "have a collection named #{ @collection_name.inspect }"
    end

    def initialize( collection_name )
      @collection_name = collection_name.to_s
    end

    def matches?( klass )
      @classsame = klass.name
      klass.send( :new ).send( @collection_name ) == []
    rescue
      false
    end

    def failure_message
      "#{ @classname } should have collection named #{ @collection_name.inspect }, but hasn't."
    end

    def negative_failure_message
      "#{ @classname } shouldn't have collection named #{ @collection_name.inspect }, but has."
    end
    
  end


  class HaveAttribute

    def description
      "have an attribute named #{ @attribute_name.inspect }"
    end
    
    def initialize( attribute_name )
      @attribute_name = attribute_name.to_s
    end

    def matches?( klass )
      @classname = klass.name
      klass.send( :new ).send( @attribute_name )
      true
    rescue NoMethodError => err
      if err.message.match( Regexp.new( @attribute_name ) )
        false
      else
        raise
      end
    end

    def failure_message
      "#{ @classname } should have attribute named #{ @attribute_name.inspect }, but hasn't."
    end

    def negative_failure_message
      "#{ @classname } should not have attribute named #{ @attribute_name.inspect }, but has."
    end
    
  end



  def have_collection( collection_name )
    HaveCollection.new( collection_name )
  end

  def have_attribute( attribute_name )
    HaveAttribute.new( attribute_name )
  end
  
end
