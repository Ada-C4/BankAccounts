module Bank

  class SavingsAccount < Account
    def initialize(id, initial_balance, open_date)
      super(id, initial_balance, open_date)
      @min_balance = 1000
      if initial_balance.to_i < @min_balance
          raise ArgumentError, "Invalid Balance: Balance may not be less than $10.00"
      end
    end

    def withdraw(withdraw_amount)
      fee = 200
      if withdraw_amount > @min_balance
        puts "Warning: Balance may not go under $10.00. Transaction terminated."
        return @balance
      else
        @balance -= (withdraw_amount + fee)
        puts "There is a transaction fee of $2.00."
        return @balance
      end
    end

    def add_interest(rate)
      interest = @balance * (rate.to_f / 100)
      @balance += interest
      return interest
    end

  end

end
