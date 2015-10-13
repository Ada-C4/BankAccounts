module Bank

  class SavingsAccount < Account
    def initialize(id, balance, open_date)
      super

      @min_balance = 10_00
      @act_withdraw_fee = 200

      if @balance < @min_balance
        raise StandardError, "You cannot open an account with less than $10."
      end
    end

    def add_interest(rate)
      interest = @balance * (rate/100)
      @balance += interest

      puts "You've earned #{interest} cents in interest, and your new balance is #{@balance}"
    end

  end
end
