require 'singleton'
require 'thread' 

module Domain 

#Author::Simon Symeonidis | 5887887 
# The booking catalogue that stores
# who has booked for a specific event 
class BookingCatalogue

  include Singleton

public 

  # Default constructor w/ no params 
  def initialize
    @Bookings = Hash.new 
  end 

  # Register the user for the specified 
  # event 
  def createBooking(user,event,count) 
    semaphore = Mutex.new 
    
    semaphore.synchronize {
    if @Bookings.has_key? user and @Bookings[user].has_key? event
      @Bookings[user][event] += count.to_i
    else
      if !@Bookings.has_key? user 
        @Bookings[user] = Hash.new 
      end   
      @Bookings[user][event] = count.to_i
    end 
    } 
    p @Bookings
  end 

  # Return all the bookings. 
  def getBookings
    @Bookings 
  end 
  
  # Return all the bookings as a string. 
  def viewAllBookings
    @Bookings.to_s
  end 
 
private 

  attr :Bookings

end 

end 
