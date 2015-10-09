module Bank
  # this will inherit behavior from Account class with '<'
  class CheckingAccount < Account

    attr_reader :checks
    def initialize(id, balance, open_date)
      super
      @checks_used = 0
    end

    def withdrawl(amnt_withdrawn) # add withdrawl functionality
      fee_and_withdrawl = amnt_withdrawn + 100  # subtract $2 from balance (add to amnt_withdrawn)
      if @balance - fee_and_withdrawl < 0  # Can't go negative.
        # Outputs warning and un-modified balance
        puts "You can't take out more $$ than you have ($#{@balance})! Don't forget, there is a $1 transaction fee."
        return @balance
      else
      super(fee_and_withdrawl)
      end
      return @balance
    end

    def withdrawl_using_check(amount)
      if @checks_used >= 3 # Can use 3 checks for free
        check_fee = 200
      else
        check_fee = 0 # No fee for less than three checks
        @checks_used += 1
      end
        if amount + check_fee <= @balance + 1000
          @balance = @balance - (amount + check_fee) # Input is taken out of balance
          puts "Now you have $#{@balance/100} in your account" # so it shows up as dollars, not cents.
        else
          "We only let you overdraft up to $10. Write a smaller check."
        end
      return @balance  
    end

    def reset_checks
      @checks_used = 0
    end
  end
end
