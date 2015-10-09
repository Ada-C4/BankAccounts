module Bank

  class MoneyMarketAccount < SavingsAccount
    attr_reader :transaction_count

    def initialize(account_id, initial_balance, open_date, min_balance = 1000000, fee = 0)
      super
      @transaction_count = 0
    end

    def withdraw(amount)
        if account_frozen? || transaction_count_exceeded?
          return @balance
        elsif amount <= @balance - @min_balance
          @balance -= amount
        else
          @balance -= (amount + 10000)
        end
      @transaction_count += 1
      return @balance
    end

    def deposit(amount)
      if transaction_count_exceeded?
        return @balance
      elsif account_frozen? && (@balance + amount) >= @min_balance
      else
        @transaction_count += 1
      end
      super
    end

    def account_frozen?
      @balance < @min_balance
    end

    def transaction_count_exceeded?
      @transaction_count >= 6
    end

    def reset_transactions
      @transaction_count = 0
    end

  end

end
