require_relative 'IFactory.rb'
require_relative '../Event.rb'
require_relative '../EventCatalogue.rb'
require_relative '../EventSpecificationCatalogue.rb'

module Domain 
module Helpers 

#Author::Simon Symeonidis | 5887887
# Factory that creates a list of dummy events for 
# the event catalogue. 
class DummyEventListFactory < IFactory

public 

  # Default init w/ no params 
  def initialize 
  end 

  # load the dummy events 
  def load 
    EventSpecificationCatalogue.instance.add("music", Time.new, rand(100))
    EventSpecificationCatalogue.instance.add("cacophony", Time.new, rand(100))
    EventSpecificationCatalogue.instance.add("tsifteteli", Time.new, rand(100))
    EventSpecificationCatalogue.instance.add("bouzouki night", Time.new, rand(100))

    ev = Event.new 
    ev.Specification = EventSpecificationCatalogue.instance.getByID(0)
    EventCatalogue.instance.registerNewEvent(ev)
    
    ev = Event.new 
    ev.Specification = EventSpecificationCatalogue.instance.getByID(1)
    EventCatalogue.instance.registerNewEvent(ev)

    ev = Event.new 
    ev.Specification = EventSpecificationCatalogue.instance.getByID(2)
    EventCatalogue.instance.registerNewEvent(ev)

    
    ev = Event.new 
    ev.Specification = EventSpecificationCatalogue.instance.getByID(3)
    EventCatalogue.instance.registerNewEvent(ev)
  end 

private 

end 

end
end 
