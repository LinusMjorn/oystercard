class Oystercard

  attr_reader :balance, :in_journey

  DEFAULT_VALUE = 15
  DEFAULT_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_VALUE)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    fail "Limit is £#{DEFAULT_LIMIT}" if @balance + amount > DEFAULT_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    fail "Minimum fare is £#{MINIMUM_FARE}" if @balance < MINIMUM_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end
