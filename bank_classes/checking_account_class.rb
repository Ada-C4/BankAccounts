# Create a `CheckingAccount` class which should inherit behavior from the `Account` class. It should include the following updated functionality:
# - Updated withdrawal functionality:
module Bank

require "./account_class.rb"
require "pry"

    class CheckingAccount < Account

      def initialize
        super(10_00)
        @checks_used = 0
      end

# Each withdrawal 'transaction' incurs a fee of $1 that is taken out of the balance.
      def withdraw(withdraw_amount, fee = 100, checking_min_balance = -10_00)
        min_balance = (checking_min_balance + fee)
        #inherits these from account_class withdraw:

          # Returns the updated account balance.
          # Does not allow the account to go negative. Will output a warning message and return the original un-modified balance.
        @balance = super(withdraw_amount, fee, min_balance)
      end #of withdraw method

      def withdraw_using_check(withdraw_amount)
        if @checks_used < 3
          withdraw(withdraw_amount)
          @checks_used += 1
        else
          withdraw(withdraw_amount, fee = 200)
        end
      end
      # - `#withdraw_using_check(amount)`: The input amount gets taken out of the account as a result of a check withdrawal. Returns the updated account balance.
      #   - Allows the account to go into overdraft up to -$10 but not any lower
      #   - The user is allowed three free check uses in one month, but any subsequent use adds a $2 transaction fee

      def reset_checks
        @checks_used = 0
      end
      # # - `#reset_checks`: Resets the number of checks used to zero

    end #of CheckingAccount class

end #end of medule

# - `#withdraw_using_check(amount)`: The input amount gets taken out of the account as a result of a check withdrawal. Returns the updated account balance.
#   - Allows the account to go into overdraft up to -$10 but not any lower
#   - The user is allowed three free check uses in one month, but any subsequent use adds a $2 transaction fee
# # - `#reset_checks`: Resets the number of checks used to zero
