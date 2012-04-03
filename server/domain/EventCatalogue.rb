require 'singleton'

module Domain 

#Author::Simon Symeonidis | ID 5887887
# This is the event catalogue that manages
# the required events. 
class EventCatalogue

  include Singleton 

public

  # Standard init.
  def initialize
    @Events = Array.new 
  end 

private 

  # The list of events
  attr_reader :Events

end 

end 

