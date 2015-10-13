module Bank

  class MoneyMarketAccount < SavingsAccount
    attr_reader :transactions

    def initialize(id, balance, open_date)
      @account_id = id.to_i
      @balance = balance.to_i * 100
      @open_date = open_date
      @mm_account_fee = 0
      @transactions = 6
      @act_withdraw_fee = 100_00
      @mm_min_balance = 10_000_00
      @min_balance = 0

      if @balance < @mm_min_balance
        raise StandardError, "You cannot open an account with that little money."
      end

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
