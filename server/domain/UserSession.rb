require_relative 'NormalUserFacade.rb'
require_relative 'BookingCatalogue.rb'
require_relative 'EventSpecificationCatalogue.rb'

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
  def initialize(connection, userid) 
    @SocketHandle = connection
    @UserID = userid 
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
  
        when /bookevent/i
          spl = clientMessage.split
          eventid = spl[1] 
          qty = spl[2] 
          bookEvent @UserID, eventid, qty

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
  def bookEvent userid, eventid, qty
    spec = EventSpecificationCatalogue.instance.getByID(eventid)
    
    qty = qty.to_i
    
    p spec 

    if spec.Capacity < qty
      @SocketHandle.puts "Not enough spaces" 
    else
      @SocketHandle.puts "Booked event"
      BookingCatalogue.instance.createBooking(userid,eventid,qty)
      spec.Capacity -= qty
    end

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

  attr_reader :UserID 

end 

end 
