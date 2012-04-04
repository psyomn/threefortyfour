require_relative 'CommandParser.rb'

module Presentation

#Author::Simon Symeonidis | ID 5887887 
# This is the definition for the command line interface to be used
# for connecting to the server. 
# This should request the OS for a file descriptor in order to 
# bind to a socket and connect to the server. 
#
# The responsibilities of this class is to provide the user with
# an appropriate interface. The input logic is delagated to an
# interface parser. 
class CommandInterface 

public
  # Default initialization 
  def initialize 
    @Parser = Presentation::TechnicalServices::CommandParser.new 
    @Finished = false 
  end 

  # Bootup the interface 
  def run 
    puts "Welcome to the Theater Registration"
    puts "  Type 'help' for list of available commands "

     while not @Finished do 
       print "> "
       input = $stdin.gets
       input.chomp! if !input.nil?
       if input != "quit" 
         @Parser.command(input) 
       else
         @Finished = true 
       end 
     end 
  end 

  # For running the program with the required text files. 
  def runSimulation
    simulatedClient("guy1") 
    simulatedClient("guy2") 
    simulatedClient("guy3") 
    simulatedClient("guy4") 

    simulatedAdmin
  end 

private 
  # The Command Parser for the interface 
  attr_reader :Parser
  attr_reader :Finished

  def simulatedClient(clientName) 
      @Parser.command("login user #{clientName}") 
      @Parser.command("viewall") 
      @Parser.command("bookevent 0 1") 
      @Parser.command("bookevent 1 2")
      @Parser.command("viewall") 
  end 

  def simulatedAdmin
    @Parser.command("login admin")
    @Parser.command("listbookings") 
  end
end 

end 
