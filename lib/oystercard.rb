class Oystercard

  attr_reader :balance, :entry_station

  DEFAULT_VALUE = 15
  DEFAULT_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_VALUE)
    @balance = balance
  end

  def top_up(amount)
    fail "Limit is £#{DEFAULT_LIMIT}" if @balance + amount > DEFAULT_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "Minimum fare is £#{MINIMUM_FARE}" if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out(amount = MINIMUM_FARE)
    deduct(amount)
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil ? true : false
  end
  
  private
  def deduct(amount)
    @balance -= amount
  end

end
