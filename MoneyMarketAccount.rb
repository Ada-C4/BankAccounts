module Bank

  class MoneyMarketAccount < SavingsAccount

    MIN_BALANCE = 1000000

    attr_reader :transaction_count

    def initialize (account_id, initial_balance, open_date)
      super
      @transaction_count = 0
    end

    def withdraw(amount)
        if account_frozen? || transaction_count_exceeded?
          return @balance
        elsif amount <= @balance - self.class::MIN_BALANCE
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
      elsif account_frozen? && (@balance + amount) >= self.class::MIN_BALANCE
      else
        @transaction_count += 1
      end
      super
    end

    def account_frozen?
      @balance < self.class::MIN_BALANCE
    end

    def transaction_count_exceeded?
      @transaction_count >= 6
    end

    def reset_transactions
      @transaction_count = 0
    end

  end

end
