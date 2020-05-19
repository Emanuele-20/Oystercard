class Oystercard

  attr_reader :balance, :injourney
  DEFAULT_BALANCE_VALUE = 0
  MAXBALANCE = 90
  MINBALANCE = 1
  FAIR = 1

  def initialize(default_balance = DEFAULT_BALANCE_VALUE)
    @balance = default_balance
    @injourney = false
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
    if @injourney == true
      true
    else
      false
    end
  end

  def touch_in
    fail "please top up card" if @balance < MINBALANCE
    @injourney = true
  end

  def touch_out
    deduct(FAIR)
    @injourney = false
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
