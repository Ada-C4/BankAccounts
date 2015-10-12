module Bank

  class CheckingAccount < Account

    def initialize(id, initial_balance, open_date)
      super
      @fee = 1.0
      @check_number = 1
    end

    # CheckingAccount uses the withdraw method from Account
    # This method does not need to be called here, but is left in for clarity
    def withdraw(amount_to_withdraw)
      super
    end

    def withdraw_using_check(amount_to_withdraw)
      initial_balance = @balance
      # min_balance is set to -10 for check withdrawals
      @min_balance = -10
      # If the customer has used fewer than 3 checks, the fee is set to 0, and the withdraw method from Account is run
      if @check_number <= 3
        @fee = 0
        withdraw(amount_to_withdraw)
        # If a successful withdrawal was made, the check number is incremented
        if @balance != initial_balance
          @check_number +=1
        end
      else
        # If the user has used more than 3 checks, the fee is updated and the withdraw method from Account is run
        @fee = 2.0
        withdraw(amount_to_withdraw)
        # If a successul withdrawal was made the check number is incremented
        if @balance != initial_balance
          @check_number +=1
        end
      end
      # Resets min_balance and fee to the defaults in initialize (necessary for normal withdraw method to function as expected)
      @min_balance = 0
      @fee = 1.0
      return @balance
    end

    # Resets @check_number variable to allow more withdrawals using check
    def reset_checks
      @check_number = 0
    end

  end
end
