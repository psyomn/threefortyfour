require 'socket' 

require_relative 'Configuration.rb'

module Presentation
module TechnicalServices 

#Author::Simon Symeonidis | ID 5887887
# Socket wrapper for our intetions (in order to connect to the server)
# This class is responsible only for sending said bytes to the server
# using a TCP/IP protocol. 
# It is also this objects responsability to hang up if there is 
# a timeout. 
class Connection 

public 

  # Standard initialization 
  def initialize 
    @Host = Configuration.instance.Attributes["SERVERNAME"]
    @Port = Configuration.instance.Attributes["PORTNUMBER"].to_i 
  end 

  # To send a message to the server, use this method. This will 
  # wait for a reply from the server and return its value. 
  def send_message(message) 
    @SocketHandle = TCPSocket.open(@Host,@Port)
    @SocketHandle.puts message 
    server_reply = @SocketHandle.gets 

    server_reply 
  end 

  # To be used when we want to send a message
  # from the currently opened connection
  def send_from_open_connection(message) 
    @SocketHandle.puts message 
    server_reply = @SocketHandle.gets 

    server_reply 
  end 

  def close
    @SocketHandle.close 
  end 

private 

  # The handle for the socket we'll be using in order to 
  # Communicate with the server. 
  attr_reader :SocketHandle

  # The host we'll be connecting to (this should be localhost
  # as set inside the configuration file). 
  attr_reader :Host
  
  # This is the port number where the client should connect to. 
  attr_reader :Port 

end 

end 
end 
