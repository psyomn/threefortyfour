require_relative 'IFactory.rb'
require_relative 'Configuration.rb'

module Domain
module Helpers

#Author::Simon Symeonidis | 5887887 
# This is the concrete factory that is supposed to build the events
# and other information by loading it from the database.
class ConcreteFactory < IFactory

public 

  # load the factory. 
  def initialize 
    env = Domain::TechnicalServices::Configuration.instance.Attributes["ENVIRONMENT"] 
    
    if env == "development" 
    
    elsif env == "production"  

    end 
  end 

  # implementation of the behaviour for loading
  def loadEvents
    
  end 

private 

  # The instance which will be holding 
  # the appropriate factory. 
  attr_reader :Instance

end 

end 
end 
