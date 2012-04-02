#Author::Simon Symeonidis | 5887887 
# This is the main entry point for the server 

require_relative 'Server.rb'

server = TechnicalServices::Server.new 

server.run 

