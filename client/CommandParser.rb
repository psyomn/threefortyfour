require_relative 'Connection.rb'

module Presentation
module TechnicalServices

#Author::Simon Symeonidis | ID 5887887 
# This is the parser to figure out what the commands
# mean when typed in from the user. 
# The responsability of this object it to read a string
# and parse it. No actual input should be handled here. 
class CommandParser

public

  # default constructor w/ no params. 
  def initialize
    # Available Commands 
    @AvailableCommands = Array.new 
    
    @AvailableCommands.push [:help, "lists help for commands", :helpCommand] 
    @AvailableCommands.push [:login, "login to system", :loginCommand] 
    @AvailableCommands.push [:logout, "logout from system", :logoutCommand] 
    @AvailableCommands.push [:cancel, "cancel from system", :cancelCommand] 
    @AvailableCommands.push [:reserve, "reserve from system", :cancelCommand] 

  end 

  # Handle a given command 
  def command(cmd)
    first = cmd.split[0] 
    first = "default" if cmd.split[0].nil?
    case first  
      when /help/ 
        helpCommand 

      when /login/
        loginCommand cmd
            
      when /logout/
        logoutCommand 
      
      when /viewall/ 
        viewAllCommand

      when /reserve/ 
        reserveCommand 

      when /cancel/
        cancelCommand 

      else 
        puts "Error in input. Type help for salvation." 

    end 
  end 

private 
  # The list of available commands 
  attr_reader :AvailableCommands 

  # Handle for the file descriptor/object of the socket used
  # for the connection 
  attr_reader :ConnectionHandle

  # 
  # Command Implementations 
  # 

  # The help command 
  def helpCommand
    @AvailableCommands.each do |com_row| 
        com_row.each_with_index do |desc,i| 
        print "#{desc}: " if 0 == i
        print "#{desc} "  if 1 == i
        print ", found in: #{desc} command" if 2 == i
      end 
      puts "" 
    end 
  end 

  # For loging in 
  def loginCommand param 
    @ConnectionHandle = TechnicalServices::Connection.new 
    reply  = @ConnectionHandle.send_message(param) 
    puts reply 
  end 

  # For logout 
  def logoutCommand
    @ConnectionHandle.close
    puts "Logged out"
  end 

  # For reservations 
  def reserveCommand 
    puts "TODO"
  end 

  # For cancelations 
  def cancelCommand 
    puts "TODO"
  end 

  # View all the events 
  def viewAllCommand
    puts "Sending view all request..."
    reply = @ConnectionHandle.send_from_open_connection("viewall")
    reply = reply.gsub(/\|/, "\n") 
    puts reply
  end 

end 

end 
end 
