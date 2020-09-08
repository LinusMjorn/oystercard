class Oystercard

  attr_reader :balance

  DEFAULT_VALUE = 15

  def initialize(balance = DEFAULT_VALUE)
    @balance = balance
  end

  def top_up(amount)

  @balance += amount

  end

end
