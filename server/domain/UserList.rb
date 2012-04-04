require 'singleton'

require_relative 'User.rb'

module Domain 

#Author::Simon Symeonidis | 5887887 
# Class which holds all the users. 
class UserCatalogue

  include Singleton

public

  # initialize /w no params 
  def initialize
    @Users = Array.new 
  end 

  # Return all the users 
  def getUsers
    return @Users 
  end 

  # Create a new user, add to the list 
  def createUser(admin=false) 
    usr = User.new 
    usr.Admin = admin 
    @Users.add usr 
  end 

  # Search a user by id. If found,
  # return the user, else return nil.
  def getUserByID(id)
    @Users.each do |usr| 
      return usr if usr.ID == id 
    end 

    return nil 
  end 

private 

  attr :Users 

end

end 


