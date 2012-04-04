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

  end 

  # Initialize with a pre loaded
  # list of events type (either dummy 


  # Add an event to the event specification 
  # catalogue 
  def add(type,date,capacity) 
    ev = EventSpecification.new 
    ev.Type = type 
    ev.EventDate = date 
    ev.Capacity = capacity 

    @EventSpecs.push ev 
  end 

  # Return a specification by 
  # id. If not found return nil  
  def getByID(id)
    @EventSpecs.each do |eventspec| 
      return eventspec if eventspec.ID == id.to_i 
    end 

    nil 
  end 

private 

  # The event specifications list 
  attr_reader :EventSpecs

protected 
  # Common initialization 
  def commonInit
    @EventSpecs = Array.new 
  end 

end 

end 

