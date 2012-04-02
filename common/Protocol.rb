#Author::Simon Symeonidis | ID 5887887 
# This module is used as an interface between the client and 
# server in order to give information of possible RPC actions. 
module Protocol 
  
  #
  # Actions should be represented by an unsigned byte as a header 
  # 

  # Status ok 
  OK = 0x1
  # Status bad 
  BAD = 0x2 
  # View All request 
  VIEW_ALL = 0x3
  # Create booking request 
  CREATE_BOOKING = 0x4

  
end 
