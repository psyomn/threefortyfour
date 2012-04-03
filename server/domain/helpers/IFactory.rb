require 'singleton'

module Domain
module Helpers

#Author::Simon Symeonidis | ID 5887887 
# Factory for creating the objects when the system 
# first boots up. 
class IFactory 
  include Singleton

public 

  # default constructor w/ no params 
  def initialize
  end 

  # Provide the template for implementation
  # and warn if it is not overriden 
  def load 
    raise "Not implemented"
  end 

private

end 
end 

