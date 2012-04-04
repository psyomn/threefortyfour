require_relative 'NormalUserFacade.rb'

module Domain

#Author::Simon Symeonidis 
# The user session object.
# Responsible for checking up the users
# and making sure that they exist. 
# 
# If they don't, then the connection 
# is refused. 
# 
# This is done by receiving an id from 
# the client. 
class UserSession

public 

  # Initialize by passing the socket 
  # handle to this object. 
  def initialize(connection) 
    @SocketHandle = connection
    connection.puts "User session"

    handleRequest
  end 
private 

  # handle the request from user.
  # We have a simple protocol; say, listen
  def handleRequest
    loop{
      puts "User Session Listening"
      clientMessage = @SocketHandle.gets
      clientMessage.chomp!
  
      case clientMessage
  
        when /viewall/i 
          viewAllEvents
  
        when /bookEvent/i
          bookEvent

        when /help/i
          helpCommand

        else 
          errorCommand
  
      end 
    }
  end 

  # View all events
  def viewAllEvents
    nuf = NormalUserFacade.new 
    @SocketHandle.puts nuf.viewAllEvents
  end 

  # Book event from the user
  def bookEvent
    @SocketHandle.puts "book event"
  end 

  # if the user enters a wrong command
  def errorCommand
    @SocketHandle.puts "You sent something wrong."
  end 

  # This is if something goes wrong when 
  # the client sends a message to the server.
  def helpCommand 
    @SocketHandle.puts "Commands are:"
    @SocketHandle.puts "  viewall"
    @SocketHandle.puts "  bookevent"
  end

  # The socket handle passed
  # from the server once a connection
  # has been forked.
  attr_reader :SocketHandle

end 

end 
