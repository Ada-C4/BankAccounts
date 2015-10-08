module Bank
  class Checking < Account

    def initialize(balance)
      super(balance)
    end

    #method for withdrawal
    def withdrawal(subtract_money)
      if (@balance - subtract_money - 1) >= 0
        @balance = (@balance - subtract_money - 1)
        #returns updated account balance
        return @balance
      else
      #rejects negative balance, and returns current balance
        puts "Your withdrawal was rejected. You only have #{@balance} dollars."
        puts "You are not allowed to overdraft. Try a smaller withdrawal."
      end
    end


    def withdraw_using_check(subtract_money)
      if (@balance - subtract_money.abs) >= -10
        @balance = (@balance - subtract_money.abs)
        #returns updated account balance with a transaction fee of $1 removed from balance
        return @balance
      else
      #rejects negative balance, and returns current balance
        puts "Your withdrawal was rejected. You only have #{@balance} dollars."
        puts "You are not allowed to overdraft more than $10. Try a smaller withdrawal."
      end
    end
  end
end

#Create a `CheckingAccount` class which should inherit behavior from the `Account` class. It should include the following updated functionality:
#- Updated withdrawal functionality:
#  - Each withdrawal 'transaction' incurs a fee of $1 that is taken out of the balance. Returns the updated account balance.
#    - Does not allow the account to go negative. Will output a warning message and return the original un-modified balance.
#- `#withdraw_using_check(amount)`: The input amount gets taken out of the account as a result of a check withdrawal. Returns the updated account balance.
#  - Allows the account to go into overdraft up to -$10 but not any lower
#  - The user is allowed three free check uses in one month, but any subsequent use adds a $2 transaction fee
#- `#reset_checks`: Resets the number of checks used to zero
