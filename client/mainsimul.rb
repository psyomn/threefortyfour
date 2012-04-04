#Author::Simon Symeonidis | ID 5887887 
# This is the entry point of the program. 

require_relative 'CommandInterface.rb'

puts "Simulated" 

cmd = Presentation::CommandInterface.new 

cmd.runSimulation

