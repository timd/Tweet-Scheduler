module ControllerHelpers
  
  class CallInBeforeFilter < Struct.new( :method )

    def description
      "call #{ self.method.inspect } in a before filter"
    end
    
    def matches?( klass )
      @class = klass
      sigs = @class.instance_variable_get( :@_process_action_callbacks ).map do |callback|
        "#{ callback.filter.to_s } :: #{ callback.kind.to_s }"
      end
      sigs.include?( "#{ self.method.to_s } :: before" )
    end
    
    def failure_message
      "Controller #{ @class.inspect } should be set to call #{ self.method.to_s.inspect } in before filter, but isn't."
    end
    
    def negative_failure_message
      "Controller #{ @class.inspect } should not be set to call #{ self.method.to_s.inspect } in before filter, but is."
    end
    
  end


  class HaveHelperMethod
    
    def description
      "have helper method #{ @helper_method.inspect }"
    end

    def initialize( helper_method )
      @helper_method = helper_method
    end

    def matches?( controller_class )
      @controller_class = controller_class
      @controller_class._helper_methods.include?( @helper_method.to_sym )
    end

    def failure_message
      "Controller #{ @controller_class.name } should #{ description }, but hasn't"
    end
    
  end
  
  
  def call_in_before_filter( method )
    CallInBeforeFilter.new( method )
  end

  def have_helper_method( helper_method )
    HaveHelperMethod.new( helper_method )
  end
  
end
