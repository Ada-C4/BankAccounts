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
      temp_balance = @balance - transaction_fee.to_i - withdraw_amount.to_i
      if temp_balance < 1000
        puts "You cannot have less than $10. This withdraw has been cancelled."
      else
        @balance = temp_balance
        puts "You new balance is #{@balance}"
      end
      return @balance
    end

    def add_interest(rate)
      interest_rate = rate.to_f
      added_rate = @balance * (interest_rate/100.to_f)
      @balance += added_rate
      puts "Your balance is #{@balance}"
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
      temp_balance = @balance - transaction_fee.to_i - withdraw_amount.to_i
      if temp_balance < 0
        puts "You cannot have less than $0. This withdraw has been cancelled."
      else
        @balance = temp_balance
        puts "Your new balance is #{@balance} and you have used #{@check_count} checks this month."
      end
      return @balance
    end

    def withdraw_using_check(amount)
      many_checks_fee = 200
      temp_balance = @balance - amount.to_i
      if @check_count > 2
        temp_balance -= many_checks_fee
        puts "You've already used your 3 free checks.  This transaction will incur a penalty."
      end
      if temp_balance < -1000
        puts "OVERDRAFT: You cannot have less than -$10. Transaction cancelled"
      else
        @balance = temp_balance
        @check_count += 1
        puts "Your new balance is #{@balance} and you have used #{@check_count}checks this month."
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
      if @balance < 1000000
        puts "Your account is frozen due to low funds. Deposit more to continue."
        return @balance
      end
      if @transaction_count > 5
        puts "You have used all your transactions this month."
        return @balance
      end
      @balance = @balance - withdraw_amount
      if @balance < 1000000
        @balance -= overdraft_fee
        puts "OVERDRAFT. Your account can not have less than $10,000. A fee of $#{overdraft_fee/100} has been imposed. Deposit more money before withdrawing again."
      end
      @transaction_count += 1
      puts "#{@transaction_count} is the count and $#{@balance/100} dollars is your balance"
      return @balance
    end

    def deposit(deposit_amount)
      if @balance < 1000000
        @balance += deposit_amount
      elsif @transaction_count >5
        puts "You have used all your transactions this month."
        return @balance
      else
        @balance += deposit_amount
        @transaction_count += 1
      end
      puts "#{@transaction_count} is the count and $#{@balance/100} dollars is the balance"
      return @balance
    end

    def add_interest(rate)
      interest_rate = rate.to_f
      added_rate = @balance * (interest_rate/100.to_f)
      @balance += added_rate
      return added_rate
    end

    def reset_transactions
      transaction_count = 0
      puts "#{@transaction_count} is the count and #{@balance/100} is the balance"
    end
  end
end
