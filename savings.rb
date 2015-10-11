module Bank

  class SavingsAccount < Account
    FEE = 200
    def initialize(id, initial_balance, open_date)
      super(id, initial_balance, open_date)
      @min_balance = 1000
      if initial_balance.to_i < @min_balance
          raise ArgumentError, "Invalid Balance: Balance may not be less than $10.00"
      end
    end

    def withdraw(withdraw_amount)
      if (@balance - withdraw_amount) < @min_balance
        puts "Warning: Balance may not go under $10.00. Transaction terminated."
      else
        @balance -= (withdraw_amount + FEE)
        puts "There is a transaction fee of $#{FEE/100}.00."
      end
      return @balance
    end

    def add_interest(rate)
      interest = @balance * (rate.to_f / 100)
      @balance += interest
      return interest
    end

  end

end
