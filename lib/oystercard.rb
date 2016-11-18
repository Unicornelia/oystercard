class Oystercard

  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90

  attr_reader :balance

      attr_writer :balance
      attr_reader :entry_station, :journey_history, :exit_station


  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journey_history = []
  end

  def top_up(amount)
    raise 'The card has reached its maximum, no more top up' if balance + amount > MAXIMUM_BALANCE
    @balance = balance + amount
  end

  def deduct(amount)
    @balance = balance - amount
  end

  def touch_in(entry_station)
    message = "You cannot touch in without having the minimum fare on your card"
    raise message if balance < MINIMUM_FARE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    message = "You can only touch out if you already touched in"
    raise message unless has_entry_station?
    deduct(MINIMUM_FARE)
    @exit_station = exit_station
  end

  def journey(entry_station, exit_station)
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
