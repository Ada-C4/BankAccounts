module Bank
class SavingsAccount < Account

  def initialize (id, balance, date)
    super (id, initial_balance, date)
  end

  def initial_balance
    super (1)
  end


  def withdraw (amount)
    super (amount, 2, 10)
  end

  def dd_interest(rate)
    interest = @balance * rate
    @balance = @balance + interest
    return interest
  end



end
