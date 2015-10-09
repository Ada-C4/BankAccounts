module Bank
  class SavingsAccount < Account

    FEE = 200
    MIN_BAL = 1000


    def initialize(id, initial_balance)
      super

      raise ArgumentError if @balance < 1000
    end

    def withdraw(withdrawal)
        super

      return @balance
    end

    def add_interest(rate)
      interest = @balance * rate/100
      @balance += interest

      return interest
    end

  end
end
