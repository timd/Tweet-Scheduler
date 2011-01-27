module GeneralHelpers
  
  class InheritFrom

    def initialize( parent_class )
      @parent_class = parent_class
    end

    def matches?( child_class )
      @child_class = child_class
      @child_class.ancestors.include?( @parent_class )
    end

    def failure_message
      "Class #{ @child_class.inspect } should have inherited from #{ @parent_class.inspect }, but doesn't."
    end

    def negative_failure_message
      "Class #{ @child_class.inspect } should not have inherited from #{ @parent_class.inspect }, but does."
    end
    
  end


  class HaveA

    def description
      if @expected_value
        "have an attribute #{ @attribute.inspect } with a value of #{ @expected_value.inspect }"
      else
        "have an attribute #{ @attribute.inspect }"
      end
    end

    def initialize( attribute, options={} )
      @attribute = attribute
      @expected_value = options.has_key?( :equalling ) ? options[:equalling] : nil
    end

    def matches?( object )
      @object = object
      value = object.send( @attribute )
      @expected_value.nil? || @expected_value == value
    rescue NoMethodError
      false
    end

    def failure_message
      if @expected_value
        "Expects #{ @object } to have attribute #{ @attribute.inspect } with value of #{ @expected_value.inspect }, but hasn't"
      else
        "Expects #{ @object } to have attribute #{ @attribute.inspect }, but hasn't"
      end
    end
    
  end


  class HaveSome

    def description
      if @expected_value
        "have some #{ @collection.inspect } with a value of #{ @expected_value.inspect }"
      else
        "have some #{ @collection.inspect }"
      end
    end

    def initialize( collection, options={} )
      @collection = collection
      @expected_value = options.has_key?( :equalling ) ? options[:equalling] : nil
    end

    def matches?( object )
      @object = object
      value = object.send( @collection )
      if @expected_value
        value.respond_to?( :each ) && value == @expected_value
      else
        value.respond_to?( :each )
      end
    rescue NoMethodError
      false
    end

    def failure_message
      if @expected_value
        "Expects #{ @object } to have collection #{ @collection.inspect } with value of #{ @expected_value.inspect }, but hasn't"
      else
        "Expects #{ @object } to have collection #{ @collection.inspect }, but hasn't"
      end
    end
    
  end


  def inherit_from( parent_class )
    InheritFrom.new( parent_class )
  end

  def have_a( attribute, options={} )
    HaveA.new( attribute, options )
  end
  alias :have_an :have_a

  def have_some( collection, options={} )
    HaveSome.new( collection, options )
  end
  
end
