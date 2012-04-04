require 'singleton'

module Domain 

#Author::Simon Symeonidis | ID 5887887
# This is the event catalogue that manages
# the required events. 
class EventCatalogue

  include Singleton 

public

  # intialize without any parameters 
  def initialize 
    commonInit

  end 

  # Returns all the event from 
  # the catalogue
  def getAllEvents
    return @Events 
  end 

  # To register a new event upon request. 
  def registerNewEvent(event) 
    @Events.push event
  end 

private 

  # Common initialization 
  def commonInit
    @Events = Array.new 
  end 

  # The list of events
  attr_reader :Events

end 

end 

