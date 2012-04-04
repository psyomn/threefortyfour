require_relative 'IFactory.rb'
require_relative 'DummyEventListFactory.rb'
require_relative 'EventListFactory.rb'
require_relative '../technicalservices/Configuration.rb'

module Domain
module Helpers

#Author::Simon Symeonidis | ID 5887887 
# This is the concrete factory that is supposed to build the events
# and other information by loading it from the database.
class ConcreteFactory

public 

  # load the factory. 
  def initialize 
    env = TechnicalServices::Configuration.instance.Attributes["ENVIRONMENT"] 
    
    if env == "development" 
      puts "Loading in development environment"
      @Instance = DummyEventListFactory.new 
    elsif env == "production"  
      puts "Loading in production environment"
      @Instance = EventListFactory.new 
    end 
  end 

  # implementation of the behaviour for loading
  def load
    @Instance.load 
  end 

private 

  # The instance which will be holding 
  # the appropriate factory. 
  attr_reader :Instance

end 

end 
end 
