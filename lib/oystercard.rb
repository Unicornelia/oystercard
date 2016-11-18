require'journey'

class Oystercard

  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90

  attr_accessor :balance, :journey

  def initialize
    @journey = Journey.new
    @balance = 0
  end

  def top_up(amount)
    raise 'The card has reached its maximum, no more top up' if balance + amount > MAXIMUM_BALANCE
    self.balance = balance + amount
  end

  def deduct(amount)
    self.balance = balance - amount
  end

  def touch_in
    message = "You cannot touch in without having the minimum fare on your card"
    raise message if balance < MINIMUM_BALANCE
  end

  def touch_out
    message = "You can only touch out if you already touched in"
    raise message unless self.journey.journey_started
    deduct(MINIMUM_BALANCE)
  end

end
