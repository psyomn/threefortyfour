require 'socket'

# User headers. 
require_relative 'Connection.rb'
require_relative 'Configuration.rb'

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
class Server 

public
  # Standard inits for the server object go here 
  def initialize 
    @ServerHandle = TCPServer.new TechnicalServices::Configuration.instance.Attributes["PORT"].to_i
    @Done = false 
  end 

  # The entry point for starting up the server.  
  def run 
   puts "Booting up server..."
   puts "  > Using port [#{TechnicalServices::Configuration.instance.Attributes["PORT"]}]"
   puts "Server is up "
   
    loop {
     begin
       Thread.start(@ServerHandle.accept) do |client| 
       # 
       # TODO 
       #   Make sure we're careful about the file descriptors here (we should make sure
       #   that they are disposed of appropriately when a session is complete) 
       # 
       p client
       str = client.gets
       puts "str:" + str.to_s
       client.puts "Got your message, chum." 
       client.close
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

