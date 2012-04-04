
module Persistence 

class EventSpecificationTDG 

public

  def initialize
  end 

  def selectAll
  end 

private
  attr_reader :TableSchemaSQL

  # On first run, create the table if not exists
  # This is to ease development or testing from the 
  # TAs. 
  def firstRun
  end 

end 

end 
