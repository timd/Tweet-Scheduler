module ModelHelpers

  module MessagesFromDescription
    def failure_message; "#{ @model.name } should #{ description }, but doesn't"; end
    def negative_failure_message; "#{ @model.name } should not #{ description }, but does"; end
  end
  

  class ValidatePresenceOf
    include MessagesFromDescription
    
    def description
      "validate presence of #{ @attribute.inspect }"
    end

    def initialize( attribute )
      @attribute = attribute
    end

    def matches?( model )
      @model = model
      @model.validators_on( @attribute ).map( &:class ).include?( ActiveModel::Validations::PresenceValidator )
    end
    
  end


  class ValidateUniquenessOf
    include MessagesFromDescription
    
    def description
      if @scope
        "validate uniqueness of #{ @attribute.inspect } within scope #{ @scope.inspect }"
      else
        "validate uniqueness of #{ @attribute.inspect }"
      end
    end

    def initialize( attribute, options={} )
      @attribute = attribute
      @scope = options.delete( :scope )
    end

    def matches?( model )
      @model = model
      if @scope
        @model.validators_on( @attribute ).select { |v| v.is_a?( ActiveRecord::Validations::UniquenessValidator ) }.map do |v|
          return true if v.options.has_key?( :scope ) && v.options[:scope] == @scope
        end
        false
      else
        @model.validators_on( @attribute ).map( &:class ).include?( ActiveRecord::Validations::UniquenessValidator )
      end
    end
    
  end


  class ValidateNumericalityOf
    include MessagesFromDescription
    
    def description
      if @only_integer
        "validate integer numericality of #{ @attribute.inspect }"
      else
        "validate numericality of #{ @attribute.inspect }"
      end
    end

    def initialize( attribute, options={} )
      @attribute = attribute
      @only_integer = options.has_key?( :only_integer ) ? options.delete( :only_integer ) : false
    end

    def matches?( model )
      @model = model
      @model.validators_on( @attribute ).select { |v| v.is_a?( ActiveModel::Validations::NumericalityValidator ) }.map do |v|
        if @only_integer
          return true if v.options.has_key?( :only_integer ) && v.options[:only_integer]
        else
          return true
        end
      end
      false
    end
    
  end

  class ValidateFormatOf
    include MessagesFromDescription

    def description
      "validate format of #{ @attribute.inspect } with #{ @pattern.inspect }"
    end

    def initialize( attribute, options )
      @attribute = attribute
      @pattern = options.delete( :with )
    end

    def matches?( model )
      @model = model
      @model.validators_on( @attribute ).select { |v| v.is_a?( ActiveModel::Validations::FormatValidator ) }.map do |v|
        return true if v.options[:with] == @pattern
      end
      false
    end
    
  end


  def validate_presence_of( attribute )
    ValidatePresenceOf.new( attribute )
  end

  def validate_uniqueness_of( attribute, options={} )
    ValidateUniquenessOf.new( attribute, options )
  end

  def validate_numericality_of( attribute, options={} )
    ValidateNumericalityOf.new( attribute, options )
  end

  def validate_format_of( attribute, options )
    ValidateFormatOf.new( attribute, options )
  end
  
end
