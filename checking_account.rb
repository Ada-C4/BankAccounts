module Bank

require 'csv'

  class CheckingAccount < Account

    def initialize(account_id, balance, datetime_open, owner = nil)
      super
      @withdrawal_fee = 1
      @checks_used = 0
    end

    def withdraw_using_check(amount)
      if @checks_used >= 3
        @withdrawal_fee = 0
      end
      if (@balance - amount - @withdrawal_fee) < -10
        puts "Unable to make this withdrawal"
      else
        @balance -= (amount + @withdrawal_fee)
        puts @withdrawal_fee
        puts "The new balance is: #{@balance}"
        @checks_used += 1
      end
      return @balance
    end

    def reset_checks
      @checks_used = 0
      @withdrawal_fee = 1
    end
  end
end
