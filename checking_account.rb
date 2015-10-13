# Create a CheckingAccount class which should inherit behavior from the Account class.
#It should include the following updated functionality:
#
# Updated withdrawal functionality:
# Each withdrawal 'transaction' incurs a fee of $1 that is taken out of the balance.
# Returns the updated account balance.
# Does not allow the account to go negative. Will output a warning message and return the original un-modified balance.
# #withdraw_using_check(amount): The input amount gets taken out of the account as a result of a check withdrawal. Returns the updated account balance.
# Allows the account to go into overdraft up to -$10 but not any lower
# The user is allowed three free check uses in one month, but any subsequent use adds a $2 transaction fee
# #reset_checks: Resets the number of checks used to zero

require "./bankv2.rb"

class Checking < Bank::Account
  def initialize (id, balance, open_date)
    super
    @check = 0
  end

  def withdraw(take_money)
    super
    @balance -= 100 if take_money > @balance
    # return @balance
  end

  def withdraw_using_check(amount)
    if @balance - amount <= -1000
        puts "You cannot withdraw more than -$10.00 from your acount."
      else
        @balance -= amount
        @check = @check + 1
        if @check > 3
          @balance = @balance - 200
        end
      return @balance
    end
  end

  def reset_checks
    @checks = 0
  end

end
