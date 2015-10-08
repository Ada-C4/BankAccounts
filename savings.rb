# figure out how to add to Bank module
module Bank

  class SavingsAccount < Account
    def initialize(id, balance, open_date)
      super
      if @balance < 1000
        raise StandardError, "You cannot open an account with less than $10, or 1000 cents."
      end

      @min_balance = 1000
      @act_withdraw_fee = 200
    end

    def withdraw(withdraw_amt)
      super
    end

    def add_interest(rate)
      interest = @balance * (rate/100)
      @balance += interest

      puts "You've earned #{interest} cents in interest, and your new balance is #{@balance}"
    end

  end
end
