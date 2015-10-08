module Bank

  class SavingsAccount < Account
    def initialize(id, initial_balance, open_date)
      super(id, initial_balance, open_date)
      if initial_balance.to_i < 1000
          raise ArgumentError, "Invalid Balance: Balance may not be less than $10.00"
      end
    end

    def withdraw(withdraw_amount)
      fee = 200
      if withdraw_amount > (@balance - 1000)
        puts "Warning: Balance may not go under $10.00. Transaction terminated."
        return @balance
      else
        @balance -= (withdraw_amount + fee)
        puts "There is a transaction fee of $2.00."
        return @balance
      end
    end

  end

end


# s = Bank::SavingsAccount.new("1212","10000","1999-03-27 11:30:09 -0800")
