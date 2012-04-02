module Domain 

#Author::Simon Symeonidis | ID 5887887
# The event specifications that may be 
# plugged in to each event. 
class EventSpecification
  
public 
  # Event ID 
  attr :ID
  
  # Event Type
  attr :Type
  
  # Event Lock
  attr :Lock

  # Event date 
  attr :EventDate 

  # Capacity 
  attr :Capacity

  # Standard initializement 
  def initialize
    @ID = nil 
    @EventDate = DateTime.new
	 @Lock = false 
	 @Type = String.new 
	 @Capacity = 0 
  end 

private 

end 

end 

