#Author::Simon Symeonidis | 5887887 
# This is the main entry point for the server 

require_relative 'domain/technicalservices/Server.rb'

server = Domain::TechnicalServices::Server.new 

server.run 

