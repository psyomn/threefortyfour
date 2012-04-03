require 'singleton'
require_relative 'EventSpecification'

module Domain 

#Author::Simon Symeonidis | ID 5887887 
# The event specification catalogue that
# will contain all the specification information
# for different event types. 
class EventSpecificationCatalogue

  include Singleton

public

  # default construct; no params 
  def initialize 
    commonInit 

    @EventSpecs = eventTypeList 
  end 

  # Initialize with a pre loaded
  # list of events type (either dummy 
  # specifications, or the db ones). 
  def initialize(eventTypeList) 
    commonInit 

    @EventSpecs = eventTypeList 
  end 


  # Add an event to the event specification 
  # catalogue 
  def add(type,date,capacity) 
    ev = EventSpecification.new 
    ev.Date = date 
    ev.Capacity = capacity 

    @EventSpecs.push ev 
  end 

private 

  # The event specifications list 
  attr_reader :EventSpecs

  # Common initialization 
  def commonInit
    @EventSpecs = Array.new 
  end 

end 

end 

