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
  def initialize
    # Available Commands 
    @AvailableCommands = Array.new 
    
    @AvailableCommands.push [:help, "lists help for commands", :help_command] 

  end 

  # Handle a given command 
  def command(cmd)
    first = cmd.split[0] 
	 first = "default" if !cmd.split[0].nil?
    case first  
      when /help/ 
        help_command 

      when /login/
        login_command cmd
            
      when /logout/
        logout_command 
      
      when /reserve/ 
        reserve_command 

      when /cancel/
        cancel_command 
    end 
  end 

private 
  attr_reader :AvailableCommands 
  # 
  # Command Implementations 
  # 

  # The help command 
  def help_command
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
  def login_command param 
    puts "TODO"
    conn = TechnicalServices::Connection.new 
    reply  = conn.send_message("hello world") 

	 puts reply 
  end 

  # For logout 
  def logout_command
    puts "TODO"
  end 

  # For reservations 
  def reserve_command 
    puts "TODO"
  end 

  # For cancelations 
  def cancel_command 
    puts "TODO"
  end 

end 

end 
end 