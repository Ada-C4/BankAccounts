module Bank

  class MoneyMarketAccount < Account
    # Money market has two fees - the normal withdrawal fee (@fee) and the fee assessed when the balance goes below 10_000 (@money_market_fee)
    # Money Market has a transactions variable to keep track of the numer of transactions for the month (no other account has this)
    def initialize(id, initial_balance, open_date)
      super
      @transactions = 0
      @min_balance = 10000.00
      @fee = 0
      @money_market_fee = 100.00
      @acct_type = "MoneyMarket"

      # Check that the initial balance is above min_balance
      if initial_balance.to_f < @min_balance
        raise ArgumentError, "The balance cannot be less than $#{@min_balance}."
      end
    end


    def withdraw(amount)
      # If you have made more than 6 transactions, the transaction will not go through
      if @transactions >= 6
        puts "You cannot make any more transactions this month."
      else
        # If you have made fewer than 6 transactions, MoneyMarket uses the Account withdraw method and increments @transactions
        super
        @transactions += 1
      end
    end

    def deposit(amount)
      # If the balance is below min balance, the user can make a deposit even if they have hit max transactions
      if @balance < @min_balance
        super
      # If the balance is not below min balance and the user has made more than 6 transactions, the transaction will not go through
      elsif @transactions >= 6
        puts "You cannot make any more transactions this month."
      else
        # If the balace is above min balance and the transactions are below 6, MoneyMarket uses the Account deposit method and increments @transactions
        super
        @transactions += 1
      end
    end
    # The MoneyMarket account calls the add_interest method directly from Accounts
    # This line is not necessary, but it being kept in for clarity
    def add_interest(rate)
      super
    end

    # Method to reset the @transactions variabale and allow additional transactions
    def reset_transactions
      @transactions = 0
    end

  end
end
