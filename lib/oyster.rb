class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journeys
  DEFAULT_BALANCE_VALUE = 0
  MAXBALANCE = 90
  MINBALANCE = 1
  FARE = 1 #min charge

  def initialize(default_balance = DEFAULT_BALANCE_VALUE)
    @balance = default_balance
    @journeys = []
  end

  def top_up(top_up_value)
    if (@balance + top_up_value) > MAXBALANCE
   raise RuntimeError
    end
   @balance += top_up_value
  end

  # def deduct(deduct_value)
  #   @balance -= deduct_value
  # end

  def in_journey?
    !!@entry_station
  end

  def touch_in(entry_station)
    fail "please top up card" if @balance < MINBALANCE
    @entry_station = entry_station
    journeys.push({ :entry_station => entry_station})
  end

  def touch_out(exit_station)
    deduct(FARE)
    @entry_station = nil
    @exit_station = exit_station
    @journeys.push({ :exit_station => exit_station})
    p @journeys
  end


  # private

  # def max_value?
  #   @balance > 90 #|| @top_up_value > 90
  # end
  private

  def deduct(deduct_value)
    @balance -= deduct_value
  end


end
