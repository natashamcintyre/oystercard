class Oystercard
attr_reader :balance, :state
LIMIT = 90
MIN_FARE = 1

  def initialize
    @balance = 0
    @state = false
  end

  def top_up(amount)
    raise "Balance cannot exceed #{LIMIT}" if @balance + amount > LIMIT

    @balance += amount
  end

  def touch_in
    fail "Insufficient funds" if @balance < MIN_FARE
    @state = true
  end

  def in_journey?
    @state
  end

  def touch_out
    self.deduct(MIN_FARE)
    @state = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
