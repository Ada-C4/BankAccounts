module Bank
  class MoneyMarketAccount < Account

    def initialize(id, initial_balance)
      super

      @transactions = 0
      @lock = false
      raise ArgumentError if @balance < 1000000
    end

    def withdraw(withdrawal)
      if @transactions < 6 && @lock == false
        super
        @transactions += 1 if withdrawal <= @balance && withdrawal > 0
        if @balance < 1000000
          @balance -= 10000
          @lock = true
        end
      else
        print "Your account is locked until your balance is restored to 1000000. " if @lock
        print "You have reached your maximum of 6 transactions this month. " if @lock == false
      end

      return @balance
    end

    def deposit(deposit_amt)
      @transactions += 1 if deposit_amt <= @balance && @balance >= 1000000 && deposit_amt > 0
      @lock = false if deposit_amt + @balance > 1000000

      if @transactions <= 6 && @lock == false
        super
      else
        print "Your account is locked until your balance is restored to 1000000. " if @lock
        print "You have reached your maximum of 6 transactions this month. " if @lock == false
      end

      return @balance
    end

    def add_interest(rate)
      interest = @balance * rate/100
      @balance += interest

      return interest
    end

    def reset_transactions
      @transactions = 0
    end

  end
end
