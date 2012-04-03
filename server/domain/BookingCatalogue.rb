require 'singleton'

module Domain 

#Author::Simon Symeonidis | 5887887 
# The booking catalogue that stores
# who has booked for a specific event 
class BookingCatalogue

  include Singleton

public 

  # Default constructor w/ no params 
  def initialize
    @Bookings = Array.new 
  end 

  # Register the user for the specified 
  # event 
  def createBooking(user,event) 
  end 

  # Return all the bookings. 
  def getBookings
  end 
 
private 

  attr :Bookings

end 

end 
