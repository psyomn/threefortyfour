require_relative 'EventCatalogue.rb'

module Domain 

#Author::Simon Symeonidis 
# This is the facade for the use
# session to use in order to perform
# different user action such as uc-01
class NormalUserFacade 

public 

  # initialize w/ no params.
  def initialize
  end 

  # View all the events of the 
  # event catalogue 
  def viewAllEvents
    str = String.new 
    EventCatalogue.instance.getAllEvents.each do |event| 
      str += event.to_s + "|" 
    end 

    return str 
  end 

  # Book a specific event
  def bookEvent
  end 

private


end 


end 

