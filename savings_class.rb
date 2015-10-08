module Bank
  class Savings < Account
    def initialize(balance)
      super(balance)
      @transaction_fee = 2
    end

    def balance_restriction (balance)
      if balance < 10
        raise Exception.new("Your balance is not allowed to go below $10!")
      else
        return balance
      end
    end

    def interest(rate)
      previous_balance = @balance
      @balance = previous_balance + (@balance * rate)/100
      interest_earned = @balance - previous_balance
      return "Your balance is #{@balance} dollars and you have earned #{interest_earned} dollars in interest"
    end

    def withdrawal(subtract_money)
      if (@balance - subtract_money - @transaction_fee) >= 10
        @balance = (@balance - subtract_money - @transaction_fee)
        #returns updated account balance
        return @balance
      else
      #rejects negative balance, and returns current balance
        puts "Your withdrawal was rejected. You only have #{@balance} dollars."
        puts "You are not allowed to overdraft. Try a smaller withdrawal."
      end
    end
  end
end

#Create a `SavingsAccount` class which should inherit behavior from the `Account` class. It should include the following updated functionality:
#- The initial balance cannot be less than $10. If it is, this will `raise` an `ArgumentError`
#- Updated withdrawal functionality:
#  - Each withdrawal 'transaction' incurs a fee of $2 that is taken out of the balance.
#  - Does not allow the account to go below the $10 minimum balance - Will output a warning message and return the original un-modified balance
#
#It should include the following new method:
#- `#add_interest(rate)`: Calculate the interest on the balance and add the interest to the balance. Return the **interest** that was calculated and added to the balance (not the updated balance).
#  - Input rate is assumed to be a percentage (i.e. 0.25).
#  - The formula for calculating interest is `balance * rate/100`
#    - Example: If the interest rate is 0.25% and the balance is $10,000, then the interest that is returned is $25 and the new balance becomes $10,025.
