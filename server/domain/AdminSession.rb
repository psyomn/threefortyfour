
module Domain 

#Author::Simon Symeonidis | 5887887 
# The admin session object
class AdminSession 

public 

  # Initialize the session object 
  # with a given socket handle 
  def initialize(connection) 
    @SocketHandle = connection 
  end 

  # View all bookings as requested frrom the 
  # term assignment 
  def viewAllBookings
    connection.puts "View All Bookings" 
  end 

private 
  
  # The socket handle passed
  # from the server once a connection
  # has been forked.
  attr_reader :SocketHandle

end 

end 


