module Bank
  class MoneyMarketAccount
    def initialize
      super

      @min_balance = 10_000_000
      @transactions = 6
    end

    def withdraw(amount)
      super
      @transactions -= 1
    end

    def deposit(amount)
      super
    end

  end
end
