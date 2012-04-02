require_relative 'EventSpecification.rb'

module Domain 

#Author::Simon Symeonidis | ID 5887887
# This is the class that represents an
# atomic event. 
class Event

public 

  # The specification class for this particular
  # event
  attr :Specification 
  
  # Standard initializement 
  def initialize 
    @Specification = EventSpecification.new
  end 

  # return the id of the event
  def get_id 
  end 

  # return the type of the event
  def get_type
  end 

private 

end 

end 

