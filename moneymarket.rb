module Bank
  class MoneyMarketAccount < Account
    def initialize(id, initial_balance, open_date)
      super(id, initial_balance, open_date)
      @min_balance = 1000000
      if initial_balance.to_i < @min_balance
          raise ArgumentError, "Invalid Balance: Balance may not be less than $10,000.00"
      end
    end
  end
end
