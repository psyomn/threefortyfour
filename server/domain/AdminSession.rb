require_relative 'BookingCatalogue.rb'

module Domain 

#Author::Simon Symeonidis | 5887887 
# The admin session object
class AdminSession 

public 

  # Initialize the session object 
  # with a given socket handle 
  def initialize(connection) 
    @SocketHandle = connection 
    connection.puts "Admin session"

    handleRequest
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

  # handle the requests from the admin
  def handleRequest
    loop{
      puts "Admin Session Listening"
      clientMessage = @SocketHandle.gets
      clientMessage.chomp!
  
      case clientMessage
  
        when /viewallbookings/i 
          viewAllBookings
  
        when /neweventspec/i
          newEventSpec

        else 
          errorCommand
  
      end 
    }
  end 

  # For viewing all the bookings in a particular 
  # booking
  def viewAllBookings 
    @SocketHandle.puts "Bookings : " + BookingCatalogue.instance.viewAllBookings 
  end

  def newEventSpec
  end 

  # Default 
  def errorCommand 
  end 

end 

end 


