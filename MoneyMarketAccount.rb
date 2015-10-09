module Bank

  class MoneyMarketAccount < SavingsAccount
    attr_reader :transaction_count

    def initialize(account_id, initial_balance, open_date, min_balance = 1000000, fee = 0)
      super
      @transaction_count = 0
    end

    def withdraw(amount)
        if account_frozen?
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
      if account_frozen? && (@balance + amount) >= @min_balance
      else
        @transaction_count += 1
      end
      super
    end

    def account_frozen?
      @balance < @min_balance
    end

  end

end
