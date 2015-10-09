module Bank
  class MoneyMarketAccount < Savings
    attr_reader :transactions

    def initialize(id, balance, open_date)
      super

      @transactions = 6
      @min_balace = 0
      @act_withdraw_fee = 100_00
      @mm_min_balance = 10_000_00
    end

    def withdraw(amount)
      if @balance >= @mm_min_balance
        if @transactions > 0
          super
          @transactions -= 1
        end
      else
        puts "You must deposit at least #{@mm_min_balance - @balance} before you can withdraw any more."
      end
    end

    def reset_transactions
      @transactions = 6
    end

  end
end
