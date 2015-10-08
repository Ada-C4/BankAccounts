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
      @balance = @balance + added_rate
      return added_rate
    end
  end

  class CheckingAccount < Account
    def initialize(id, balance, open_date)
      #super(id, balance, open_date)
      @check_count = 0

    end

    def withdraw(withdraw_amount)
      transaction_fee = 100
      @balance = @balance.to_i - transaction_fee.to_i - withdraw_amount.to_i
      if @balance < 0
        puts "You cannot have less than $0. This withdraw has been cancelled."
        @balance = @balance + withdraw_amount.to_i + transaction_fee
      end
      return @balance
    end

    def withdraw_using_check(amount)
      @balance = @balance.to_i - amount.to_i
      @check_count += 1
        if @check_count > 3
          puts "You do not have any more checks this month. Transaction cancelled."
          @balance = @balance.to_i + amount.to_i
        end
        return @balance
    end

    def reset_checks
      

    end
  end
end
