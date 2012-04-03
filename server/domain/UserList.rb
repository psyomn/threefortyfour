require 'singleton'

require_relative 'User.rb'

module Domain 

class UserCatalogue

  include Singleton

public

  # initialize /w no params 
  def initialize
    @Users = Array.new 
  end 

  # Return all the users 
  def getUsers
  end 

  # Create a new user, add to the list 
  def createUser(admin=false) 
    @Users.add User.new 
  end 

  # Search a user by id. If found,
  # return the user, else return nil.
  def getUserByID(id)
    @Users.each do |usr| 
      return usr if usr.ID == id 
    end 

    nil 
  end 

private 

  attr :Users 

end

end 


