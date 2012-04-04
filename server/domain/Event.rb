require_relative 'EventSpecificationCatalogue.rb'
require_relative 'EventSpecification.rb'

module Domain 

#Author::Simon Symeonidis | ID 5887887
# This is the class that represents an
# atomic event. 
class Event

public 

  # The specification class for this particular
  # event
  attr_accessor :Specification

  # XXX this might need to go. 
  attr :Theater

  # Standard initializement 
  def initialize 
  end 

  # Set the event specification by Id for this
  # particular event.
  def setByID(id)
    @Specification = EventSpecificationCatalogue.instance.getByID(id) 
  end

  # Print the event
  def to_s
    if @Specification.nil? 
      ""
    else 
      "#{@Specification.ID} #{@Specification.Type} #{@Specification.EventDate} #{@Specification.Capacity}"
    end 
  end 

private 

end 

end 

