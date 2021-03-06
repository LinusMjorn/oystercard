class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :history

  DEFAULT_VALUE = 15
  DEFAULT_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_VALUE)
    @balance = balance
    @history = []
  end

  def top_up(amount)
    fail "Limit is £#{DEFAULT_LIMIT}" if @balance + amount > DEFAULT_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "Minimum fare is £#{MINIMUM_FARE}" if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out(station, amount = MINIMUM_FARE)
    deduct(amount)
    @exit_station = station
    @history << { entry_station: @entry_station, exit_station: @exit_station }
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil ? true : false
  end

  def show_history
    @history.each do |element|
      puts "Entry station: #{element[:entry_station]}, Exit station: #{element[:exit_station]}"
    end
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
