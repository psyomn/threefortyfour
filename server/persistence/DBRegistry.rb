require 'sqlite3'

module Persistance

class DBRegistry 

public

  def initialize
    @Handle = SQLite3::Database.new("Theater.db") # TODO this shouldn't be hardcoded. 
  end 


private
  # This is the handle to the actual database. 
  attr_reader :Handle

end 

end 

