module Domain 

#Author::Simon Symeonidis | ID 5887887
# The event specifications that may be 
# plugged in to each event. 
class EventSpecification


public 

  # Event ID 
  attr_accessor :ID
  
  # Event Type
  attr_accessor :Type
  
  # Event Lock
  attr_accessor :Lock

  # Event date 
  attr_accessor :EventDate 

  # Capacity 
  attr_accessor :Capacity

  # Standard initializement 
  def initialize
    @ID = @@SelfCount 
    @EventDate = DateTime.new
	 @Lock = false 
	 @Type = String.new 
	 @Capacity = 0 

    @@SelfCount += 1
  end 

private 
  @@SelfCount = 0 
end 

end 

