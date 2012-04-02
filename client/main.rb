#Author::Simon Symeonidis | ID 5887887 
# This is the entry point of the program. 

require_relative 'CommandInterface.rb'

puts "= Theater of Rubies =" 

cmd = Presentation::CommandInterface.new 

cmd.run 

