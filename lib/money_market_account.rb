module Bank

  class MoneyMarketAccount < Account

    def initialize(id, initial_balance, open_date)
      super
      @transactions = 0
      @min_balance = 10000.00
      @fee = 0
      @money_market_fee = 100.00
      @acct_type = "MoneyMarket"
      @allowed_to_withdraw = true

      if initial_balance.to_f < @min_balance
        raise ArgumentError, "The balance cannot be less than $#{@min_balance}."
      end
    end

    # def check_transactions
    #   if @transactions >= 6
    #     puts "You cannot make any more transactions this month."
    #   else
    #     super
    #     transactions += 1
    #   end
    # end

    def withdraw(amount)
      if @transactions >= 6
        puts "You cannot make any more transactions this month."
      else
        super
        @transactions += 1
      end
    end

    def deposit(amount)
      if @transactions >= 6
        puts "You cannot make any more transactions this month."
      else
        super
        @transactions += 1
      end
    end

    def add_interest(rate)
      super
    end

    def reset_transactions
      @transactions = 0
    end

  end
end
