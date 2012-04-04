module Domain

#Author::Simon Symeonidis 
# The user session object.
class UserSession

public 

  # Initialize by passing the socket 
  # handle to this object. 
  def initialize(connection) 
    @SocketHandle = connection
    connection.puts "User session"
  end 

  # View all events
  def viewAllEvents
    @SocketHandle.puts "All events" 
  end 

  # Book event from the user
  def bookEvent
    @SocketHandle.puts "book event"
  end 

private 

  # The socket handle passed
  # from the server once a connection
  # has been forked.
  attr_reader :SocketHandle

end 

end 
