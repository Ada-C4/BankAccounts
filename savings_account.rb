# #add_interest(rate): Calculate the interest on the balance and add the interest to the balance.
 # Return the interest that was calculated and added to the balance (not the updated balance).
# Input rate is assumed to be a percentage (i.e. 0.25).
# The formula for calculating interest is balance * rate/100
# Example: If the interest rate is 0.25% and the balance is $10,000,
# then the interest that is returned is $25 and the new balance becomes $10,025.

require "./bankv2.rb"

class Savings < Bank::Account
  def initialize (id, balance, open_date)
    super
    @balance = balance
      if balance < 1000
        raise ArgumentError, "You need a minimum of $10.00 to open a savings account."
        return balance
      end
  end

  def add_interest(rate)
    @interest = @balance * rate/100
    @balance += @interest
    return @interest
  end

end

savings = Savings.new(1212, 3414, "3/27/99 11:30")
