module Bank
  class MoneyMarketAccount < Account

    def initialize(id, initial_balance)
      super

      @transactions = 0
    end

    def withdraw(withdrawal)
      if @transactions < 6
        super
        @transactions += 1 if withdrawal <= @balance
      else
        print "You have reached your maximum of 6 transactions this month. "
      end

      return @balance
    end

    def deposit(deposit_amt)
      if @transactions < 6
        super
        @transactions += 1 if deposit_amt <= @balance
      else
        print "You have reached your maximum of 6 transactions this month. "
      end

      return @balance
    end

  end
end
