require 'singleton'
module Presentation
module TechnicalServices

#Author::Simon Symeonidis | ID 5887887 
# This is just a helper class which will read a text 
# file for possible configuration. 
class Configuration 
  include Singleton 
public 
  attr_reader :Attributes 

  # Default init. Load the attributes from the configuration file
  # upon class creation. 
  def initialize 
    @Attributes = Hash.new 
    @ConfigurationFilename = "configuration.txt" 
    load_attributes 
  end 
private 
  attr_reader :ConfigurationFilename 

  # This should load the attributes from the text file.
  def load_attributes
    arr = File.open(@ConfigurationFilename).read.split

    raise "Malformed configuration file." if arr.size % 2 != 0 
    
    index = 0 
    while index < arr.size 
      @Attributes[arr[index]] = arr[index+1] 
      index += 2 
    end 
  end 


end 

end 
end 

