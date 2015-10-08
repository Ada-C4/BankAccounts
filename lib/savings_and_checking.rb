module Bank
  class SavingsAccount < Account
    def initialize(id, balance, open_date)
      super(id, balance, open_date)
        if @balance < 1000
          raise ArgumentError, "Accounts cannot be opened with less than $10. Please try again."
        end
    end

    def withdraw(withdraw_amount)
      transaction_fee = 200
      @balance = @balance.to_i - transaction_fee.to_i - withdraw_amount.to_i
      if @balance < 1000
        puts "You cannot have less than $10. This withdraw has been cancelled."
        @balance = @balance + withdraw_amount.to_i + transaction_fee
      end
      return @balance
    end

    def add_interest(rate)
      interest_rate = rate.to_f
      added_rate = @balance * (interest_rate/100.to_f)
      @balance += added_rate
      return added_rate
    end
  end

  class CheckingAccount < Account
    def initialize(id, balance, open_date)
      super(id, balance, open_date)
        @check_count = 0
    end

    def withdraw(withdraw_amount)
      transaction_fee = 100
      @balance = @balance - transaction_fee.to_i - withdraw_amount.to_i
      if @balance < 0
        puts "You cannot have less than $0. This withdraw has been cancelled."
        @balance = @balance + withdraw_amount.to_i + transaction_fee
      end
      return @balance
    end

    def withdraw_using_check(amount)
      many_checks_fee = 200
      @balance -= amount.to_i
      @check_count += 1
      if @balance < -1000
        puts "OVERDRAFT: You cannot have less than -$10. Transaction cancelled"
        @balance += amount.to_i
      end
      if @balance > -8000
        if @check_count > 3
          puts "You have used your three free checks this month. Now you get a fee!"
          @balance = @balance - amount.to_i - many_checks_fee
        end
      end
      return @balance
    end

    def reset_checks
      @check_count = 0
    end
  end

  class MoneyMarketAccount < Account
    def initialize(id, balance, open_date)
      super(id, balance, open_date)
      @transaction_count = 0
        if @balance < 1000000
          raise ArgumentError, "Accounts cannot be opened with less than $10000. Please try again."
        end
    end

    def withdraw(withdraw_amount)
      overdraft_fee = 10000
      if @balance >= 1000000
        @balance -= withdraw_amount.to_i
        @transaction_count += 1
        return @balance
        if @balance < 1000000
          @balance -= overdraft_fee
          puts "OVERDRAFT. Your account can not have less than $10,000. A fee of $#{overdraft_fee} has been imposed. Deposit more money before withdrawing again."
          return @balance
        end
      else
        puts "You do not have enough money in this account for this transaction. Deposit and try again."
        return @balance
      end
    end

    def deposit(deposit_amount)
      if @balance < 1000000
        @balance += deposit_amount
      else
        @balance += deposit_amount
        transaction_count += 1
      end
      return @balance
    end
  end
end
