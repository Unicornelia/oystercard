#marking a journey's start and endpoints

#start journey
#end journey
#journey complete?


#call fare
#entry station
#exit station


class Journey

MINIMUM_FARE = 1
PENALTY_FARE = 6

  attr_accessor :journey_started, :journey_finished
  attr_reader :entry_station, :exit_station, :journey_history


  def initialize
    @journey_started = false
    @journey_finished = false
    @entry_station = nil
    @exit_station = nil
    @journey_history = []
  end

def begin_journey(entry_station)
  self.journey_started = true
  record_entry_station(entry_station)
end

def record_entry_station(entry_station)
  @entry_station = entry_station
end

def end_journey(exit_station)
  self.journey_finished = true
  record_exit_station(exit_station)
  add_to_history
end

def record_exit_station(exit_station)
  @exit_station = exit_station
end

def journey_completed?
  return true if self.journey_started && self.journey_finished
  false
end

def fare
  return PENALTY_FARE unless journey_completed?
  MINIMUM_FARE
end

def new_journey
  journey_completed?
  @new_journey = {@entry_station => @exit_station}
end

def add_to_history
  new_journey
  @journey_history << @new_journey
end

end
