module Bank

require 'csv'

  class MoneyMarket < Account

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
      if (@balance - withdraw_amount) < @min_balance # maybe && that checks number of transactions 
        @balance -= (@min_balance_fee)
        puts "Nope"
      end
      if @transactions >= 6
        puts "No more transactions left in this month."
      else
        @balance -= withdraw_amount
        @transactions += 1
      end
    end

    def deposit(deposit_amount)
      if @transactions >= 6
        puts "No more transactions left in the this month."
      else
        @transactions += 1
        super
      end
    end
  end
end
