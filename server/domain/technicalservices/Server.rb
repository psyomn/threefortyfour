require 'socket'

require_relative 'Connection.rb'
require_relative 'Configuration.rb'
require_relative '../BookingCatalogue.rb'
require_relative '../EventCatalogue.rb'
require_relative '../UserSession.rb'
require_relative '../AdminSession.rb'
require_relative '../helpers/ConcreteFactory.rb'

module Domain
module TechnicalServices 

#Author::Simon Symeonidis | ID 5887887 
# This is the class that takes care of all sorts of 
# server responsabilities. The most notable is that
# upon object creation, the object will request for a file
# descriptor from the os, and bind a port number to it. 
# 
# The server then continues listening and waits for incoming
# requests. When a request is received, the server is responsible
# to start a new thread for that particular client. 
# 
# Authentication is done when someone is trying to connect in order
# to allow for a connection to be made (else the connection is 
# refused). 
class Server 

public

  # Standard inits for the server object go here 
  def initialize 
    @ServerHandle = TCPServer.new Configuration.instance.Attributes["PORT"].to_i
    @Done = false 

    cf = Helpers::ConcreteFactory.new 
    cf.load 
  end 

  # The entry point for starting up the server.  
  def run 
   puts "Booting up server..."
   puts "  > Using port [#{TechnicalServices::Configuration.instance.Attributes["PORT"]}]"
   puts "Server is up "
   
    loop {
     begin
       Thread.start(@ServerHandle.accept) do |client| 
       p client
       str = client.gets
       puts "str:" + str.to_s

       case str 

         when /admin/i
           AdminSession.new(client)
         
         when /user/i 
           UserSession.new(client)

         else
           client.close

       end 

       end 
     rescue => details
       puts details.message 
       retry 
     end 
   }
   
   puts "Goodbye..."
  end 

private 
  # To store the server handle for later use
  attr_reader :ServerHandle 

  # If we wish to gracefully end our server. 
  attr_accessor :Done 
end 

end 
end 

