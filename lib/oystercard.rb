class Oystercard

  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90

  attr_accessor :balance
  attr_reader :entry_station, :exit_station, :journey_history


  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journey_history = []
  end

  def top_up(amount)
    raise 'The card has reached its maximum, no more top up' if balance + amount > MAXIMUM_BALANCE
    self.balance = balance + amount
  end

  def deduct(amount)
    self.balance = balance - amount
  end

  def touch_in(entry_station)
    message = "You cannot touch in without having the minimum fare on your card"
    raise message if balance < MINIMUM_BALANCE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    message = "You can only touch out if you already touched in"
    raise message unless has_entry_station?
    deduct(MINIMUM_BALANCE)
    @exit_station = exit_station
    journey
    add_to_history
  end

  def journey
    @new_journey = {@entry_station => @exit_station}
  end

  def add_to_history
    @journey_history << @new_journey
  end

  private

  def has_entry_station?
    @entry_station != nil
  end

end
