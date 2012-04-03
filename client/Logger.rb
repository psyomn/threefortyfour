require 'singleton'

module Presentation
module TechnicalServices
#Author::Simon Symeonidis | ID 5887887
class Logger
 include Singleton
public 

  # Default constructor w/out params. 
  # We initialize the filename we will be
  # logging in this class. 
  def initialize 
    @Filename = "client.log" 
  end 

  # Log the string to the specified text file. 
  def log(message)
    File.open(@Filename, "a") do |fh| 
      fh.puts(message)
    end 
  end 

private 
  attr_reader :Filename 
end 

end 
end 

