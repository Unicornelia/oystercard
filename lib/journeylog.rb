# Initialize the JourneyLog with a journey_class parameter
#(hint: journey_class expects an object that knows how to create Journeys.
#Can you think of an object that already does this?)

#manages journeys


#start a new journey
#end journey
#journey complete?
#all journeys
#current journey

#initialize is good to have the dependency for another class here, good to have this on the top
#touch in method or a method starts a new journey, the touch in event would create a new journey

class JourneyLog

  def initialize(journey_class)
    @journey_class = journey_class
  end

  #have the ability the make a new journey any time it wants

end
