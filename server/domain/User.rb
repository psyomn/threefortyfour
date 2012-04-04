module Domain

#Author::Simon Symeonidis | ID 5887887
# The class representing users in the system. 
class User

public
  
  # The user ID
  attr_accessor :ID

  # Whether the user has 
  # admin priviledges or not 
  attr_accessor :Admin 

  def initialize
    @Admin = false 
  end 

private 

end 

end 
