require 'singleton'

module Domain 

#Author::Simon Symeonidis | ID 5887887
# This is the event catalogue that manages
# the required events. 
class EventCatalogue

  include Singleton 

public

  # Standard init. Create the hash that stores events 
  # with keys of id. 
  def initialize
    @Events = Hash.new 
  end 

  # If the id is contained in events 
  def has_id? param 
    @Events.has_key? param
  end 

  # If the event is contained
  def has_event? param 
    @Events.has_value? param 
  end 

  # Return the event by the requested id 
  def get_event_by_id id 
    if has_id? id
	   @Events[id] 
	 else 
	   nil 
	 end 
  end 

private 

  # The list of events
  attr_reader :Events

end 

end 

