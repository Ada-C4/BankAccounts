# Create a `CheckingAccount` class which should inherit behavior from the `Account` class. It should include the following updated functionality:
# - Updated withdrawal functionality:
module Bank

require "./account_class.rb"

    class CheckingAccount < Account

      def initialize
        super
      end

      def withdraw(withdraw_amount, min_balance)
        transating = true
        withdaw_limit = (@balance - (min_balance + 100))
      while transating == true do
        if (super(withdraw_amount, min_balance) 
          @balance = super(withdraw_amount, min_balance)
        else
          puts "You are attempting to withdraw #{withdraw_amount} plus a $1 fee.\nYour account cannot overdraft more than   -10.\nWould you like with withdraw an amount less than #{@balance + 900}?"
          again = gets.chomp.downcase
          case again
            when "yes" || "y"
              puts "How much would you like to withdraw? "
              withdraw_amount = gets.chomp.to_i
              transating = true
            else
                transating = false
            end #of case again
          end #of if (super(withdraw_amount)
        end #of while/do transating loop

      end #of withdraw method

    end #of CheckingAccount class

end #end of medule
#   - Each withdrawal 'transaction' incurs a fee of $1 that is taken out of the balance. Returns the updated account balance.
#     - Does not allow the account to go negative. Will output a warning message and return the original un-modified balance.
# - `#withdraw_using_check(amount)`: The input amount gets taken out of the account as a result of a check withdrawal. Returns the updated account balance.
#   - Allows the account to go into overdraft up to -$10 but not any lower
#   - The user is allowed three free check uses in one month, but any subsequent use adds a $2 transaction fee
# # - `#reset_checks`: Resets the number of checks used to zero
