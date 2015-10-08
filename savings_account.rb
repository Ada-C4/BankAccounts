class SavingsAccount < Account

  #The initial balance cannot be less than $10. If it is, this will raise an ArgumentError
  #Updated withdrawal functionality:
  #Each withdrawal 'transaction' incurs a fee of $2 that is taken out of the balance.
  #Does not allow the account to go below the $10 minimum balance - Will output a warning message and return the original un-modified balance

  def initialize(id, initial_balance, open_date)
    super

  end

  # Calculate the interest on the balance and add the interest to the balance. Return the interest that was calculated and added to the balance (not the updated balance).
  # Input rate is assumed to be a percentage (i.e. 0.25).
  # The formula for calculating interest is balance * rate/100
  # Example: If the interest rate is 0.25% and the balance is $10,000, then the interest that is returned is $25 and the new balance becomes $10,025.
  def add_interest(rate)

  end

end
