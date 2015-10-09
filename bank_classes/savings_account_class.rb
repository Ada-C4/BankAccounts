# Create a `SavingsAccount` class which should inherit behavior from the `Account` class.
module Bank

require "./account_class.rb"
require "pry"

    class CheckingAccount < Account
# It should include the following updated functionality:

# - The initial balance cannot be less than $10. If it is, this will `raise` an `ArgumentError`
      def initialize
        super(10_00)
        @checks_used = 0
      end

# - Updated withdrawal functionality:
      def withdraw(withdraw_amount, fee = 200, checking_min_balance = 10_00)
        min_balance = (checking_min_balance + fee)
        #inherits this functionality from account_class withdraw, parameters set to savings' specifications:
          # Each withdrawal 'transaction' incurs a fee of $2 that is taken out of the balance.
          #  Does not allow the account to go below the $10 minimum balance - Will output a warning message and return the original un-modified balance
          # Returns the updated account balance.
          # Does not allow the account to go negative. Will output a warning message and return the original un-modified balance.
        @balance = super(withdraw_amount, fee, min_balance)
      end #of withdraw method

# It should include the following new method:
# - `#add_interest(rate)`: Calculate the interest on the balance and add the interest to the balance. Return the **interest** that was calculated and added to the balance (not the updated balance).
#   - Input rate is assumed to be a percentage (i.e. 0.25).
#   - The formula for calculating interest is `balance * rate/100`
#     - Example: If the interest rate is 0.25% and the balance is $10,000, then the interest that is returned is $25 and the new balance becomes $10,025.
