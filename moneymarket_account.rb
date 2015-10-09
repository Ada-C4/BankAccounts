module Bank

require 'csv'

  class MoneyMarket < Account

    # @@min_balance = 10000

    attr_accessor :transactions

    def initialize(account_id, balance, datetime_open, owner = nil)
      super
      #max of 6 transactions (deposit or withdrawal)
      #initial balance !< $10000 - will raise ArgumentError
      @min_balance = 10000
      @transactions = 0
      @min_balance_fee = 100
    end

  # def transactions()
  #   @transactions += 1
  # end

    def withdraw(withdraw_amount)
      if (@balance - withdraw_amount) < @min_balance && @transactions < 6
        @balance -= (@min_balance_fee)
        puts "A $100 fee is imposed for going below $10000"
      end
      if @transactions >= 6
        puts "No more transactions left available this month."
      else
        @balance -= withdraw_amount
        @transactions += 1
      end
    end

    def deposit(deposit_amount)
      if @balance >= @@min_balance
        if @transactions < 6
          super
          @transactions += 1
        else
          puts "No more transactions left available this month."
        end
      else
        super
      end
    end

    def reset_transactions
      @transactions = 0
    end
  end
end
