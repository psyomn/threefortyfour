
module Domain

class UserSession

public 

  # Initialize by passing the socket 
  # handle to this object. 
  def initialize(connection) 
    @SocketHandle = connection
  end 

  def viewAllEvents
    @SocketHandle.puts "All events" 
  end 

private 

  attr_reader :SocketHandle

end 

end 
