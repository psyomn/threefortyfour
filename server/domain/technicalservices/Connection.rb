module Domain
module TechnicalServices 

#Author::Simon Symeonidis | ID 5887887 
# This should be the delegate of the server; 
# When the server receives an incoming connection
# it should fork to this class. 
#
# The idea is that when a user tries to login, 
# the system should listen to the crendentials
# said user provides. 
# If the credentials are correct, then the server
# shall provide a steady connection to the user 
# for all sorts of transactions. 
# If not then the system closes the given port. 
class Connection 

public 

  def initialize 
  end 

private 

end 

end 
end 
