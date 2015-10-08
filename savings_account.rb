module Bank

require 'csv'

  class SavingsAccount < Account

    def initialize(account_id, balance, datetime_open, owner = nil)
      super
      @min_balance = 10
      @withdrawal_fee = 2
    end

    def add_interest(rate)
      interest = @balance * rate/100
      puts "The interest earned on the account is: $#{interest.to_i}"
      @balance = @balance + interest
      puts "The new balance is: $#{@balance.to_i}"
    end
  end
end
