WebMock.disable_net_connect!(:allow_localhost => true)

class Object
  def __debug
    if self.is_a?( String )
      puts "*** -- #{self}"
    else
      puts "*** -- #{self.inspect}"
    end
  end
end

def __dump_page
  page.body.__debug
end

##
# Wait until there is a given xpath on the page.
#
def wait_for_xpath( xpath, timeout=30 )
  total_time = 0
  while page.has_no_xpath?( xpath )
    sleep( 0.5 )
    total_time += 0.5
    raise( "Timeout" ) if total_time == timeout
  end
end

##
# Wait until there is no given xpath on the page.
#
def wait_for_no_xpath( xpath, timeout=30 )
  total_time = 0
  while page.has_xpath?( xpath )
    sleep( 0.5 )
    total_time += 0.5
    raise( "Timeout" ) if total_time == timeout
  end
end

##
# Get elements by xpath.
#
def get_xpath_elements( xpath )
  Nokogiri::HTML( page.body ).xpath( xpath )
end

##
# Get an element (first, if in a collection) by xpath.
#
def get_xpath_element( xpath )
  get_xpath_elements( xpath ).first
end



  class SetFlash
    def initialize(key = :notice)
      @key = key.to_sym
    end

    def to(value)
      @expected_value = value
      self
    end

    def matches?(controller)
      @controller = controller
      flash_set? && flash_matches_expected?
    end

    attr_reader :failure_message, :negative_failure_message

    def description
      description = "set flash(:#{@key})"
      description << "to #{@expected_value.inspect}" if @expected_value

      description
    end

  private

    def flash_set?
      if assigned_value.nil?
        @failure_message = "Expected flash(:#{@key}) to be set, but it wasn't"
        false
      else
        @negative_failure_message = "Didn't expect flash(:#{@key}) to be set, but it was"
        true
      end
    end

    def flash_matches_expected?
      return true unless @expected_value
      if @expected_value == assigned_value
        @negative_failure_message = "Expected flash(:#{@key}) to be #{@expected_value.inspect}, but it was #{assigned_value}"
        true
      else
        @failure_message = "Expected flash(:#{@key}) to not be #{@expected_value.inspect}, but it was"
      end
    end

    def assigned_value
      @controller.__send__(:flash)[@key]
    end
  end

  def set_flash(key)
    SetFlash.new(key)
  end
