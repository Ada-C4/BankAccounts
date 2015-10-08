
module Bank
  class CheckingAccount < Account
    attr_reader :checks_used

    def initialize(id, initial_balance, open_date)
      super(id, initial_balance, open_date)
      @checks_used = 0
    end

    def withdraw(withdraw_amount)
      fee = 100
      if withdraw_amount > (@balance + 100)
        puts "Warning: Can not withdraw more than is in account. Transaction terminated."
        return @balance
      else
        @balance -= (withdraw_amount + fee)
        puts "There is a transaction fee of $1.00."
        return @balance
      end
    end

    def withdraw_using_check(withdraw_amount)
      fee = 200
      if withdraw_amount > (@balance + 1000)
        puts "Warning: Can not overdraft account more than $10.00. Transaction terminated."
      elsif @checks_used < 3
        @balance -= withdraw_amount
        @checks_used += 1
      else
        puts "You have used up your 3 free check withdrawals this month."
        puts "There is a transaction fee of $2.00"
        @balance -= (withdraw_amount + fee)
        @checks_used += 1
      end
      return @balance
    end

    def reset_checks
      @checks_used = 0
    end

  end
end
