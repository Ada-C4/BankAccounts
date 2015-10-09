module Bank
  require 'pry'

  class MoneyMarketAccount < Account
    attr_reader :checks, :transactions

    def initialize (account_id, balance, open_date, owner = nil)
      super(account_id, balance, open_date, owner = nil)
      @withdrawalfee = 1
      @min_initial_balance = 10000
      @transactions = 6
    end

    def add_interest(rate)
    end

    def reset_transactions
      @transactions = 6
    end
end
end
