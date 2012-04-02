require 'singleton'

module TechnicalServices
#Author::Simon Symeonidis | ID 5887887 
# This class takes care of configuration attributes
# that are particular for the server of the application. 
class Configuration 
  include Singleton 
public 

  attr_reader :Attributes 
  attr_reader :ConfigurationFileName

  # Standard initializement for the configuration object goes here 
  def initialize 
    @Attributes = Hash.new 
    @ConfigurationFileName = "configuration.txt" 

    load_attributes  
  end 

private

  # Load the configuration file contents in the hash
  def load_attributes
    arr = File.open(@ConfigurationFileName).read.split
    
    raise "Malformed config file" if arr.size % 2 != 0

    i = 0 
    while i < arr.count 
      @Attributes[arr[i]] = arr[i+1]  
      i += 2 
    end 
  end 

end 

end 

