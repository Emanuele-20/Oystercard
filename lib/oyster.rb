class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journeys
  DEFAULT_BALANCE_VALUE = 0
  MAXBALANCE = 90
  MINBALANCE = 1

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

  def in_journey?
    @current_journey.complete?
  end

  def touch_in(entry_station)
    fail "please top up card" if @balance < MINBALANCE

    @current_journey = Journey.new(entry_station)
  end

  def touch_out(exit_station)
    @current_journey.end_journey
    touch_out_steps
  end

  def touch_out_steps
    deduct(@current_journey.calculate_fare)
    @journeys.push(@current_journey)
    @current_journey = nil
  end

  private

  def deduct(deduct_value)
    @balance -= deduct_value
  end


end

class Journey

  FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station

  def initialize(entry_station)
    @entry_station = entry_station
  end

  def complete?
    !!@exit_station
  end

  def end_journey(exit_station)
    @exit_station = exit_station
  end

  def calculate_fare
    return PENALTY_FARE if complete? == false
    FARE
  end


end
