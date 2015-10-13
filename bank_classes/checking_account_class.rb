require "pry"

# Create a `CheckingAccount` class which should inherit behavior from the `Account` class. It should include the following updated functionality:
# - Updated withdrawal functionality:
module Bank

# require "./account_class.rb"

    class CheckingAccount < Account

      def initialize
        @checks_used = 0
      end

# Each withdrawal 'transaction' incurs a fee of $1 that is taken out of the balance.
      def withdraw(withdraw_amount, fee = 100, min_balance = -10_00)
        #inherits these from account_class withdraw:

          # Returns the updated account balance.
          # Does not allow the account to go negative. Will output a warning message and return the original un-modified balance.
        @balance = super(withdraw_amount, fee, min_balance)
      end #of withdraw method

# - `#withdraw_using_check(amount)`: The input amount gets taken out of the account as a result of a check withdrawal. Returns the updated account balance.
# calls withdraw method which:
    #  - Allows the account to go into overdraft up to -$10 but not any lower
      def withdraw_using_check(withdraw_amount)
        if @checks_used < 3
          withdraw(withdraw_amount, fee = 0)
          @checks_used += 1
#   - The user is allowed three free check uses in one month, but any subsequent use adds a $2 transaction fee
        else
          withdraw(withdraw_amount, fee = 200)
        end
      end

      # # - `#reset_checks`: Resets the number of checks used to zero
      def reset_checks
        @checks_used = 0
      end

    end #of CheckingAccount class

end #end of medule
