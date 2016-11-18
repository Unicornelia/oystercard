require_relative 'journey'

class Oystercard

  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  DEFAULT_BALANCE = 0

  attr_accessor :balance, :journey

  def initialize
    @journey = Journey.new
    @balance = DEFAULT_BALANCE
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
    journey.begin_journey(entry_station)
  end

  def touch_out(exit_station)
    message = "You can only touch out if you already touched in"
    raise message unless self.journey.journey_started
    journey.end_journey(exit_station)
    deduct(MINIMUM_BALANCE)
  end

end
