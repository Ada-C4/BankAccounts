module Bank

  class CheckingAccount < Account
    attr_reader :free_checks

    def initialize(id, balance, open_date)
      super

      @act_withdraw_fee = 100
      @free_checks = 3
    end

    def withdraw(withdraw_amt)
      super
    end

    def withdraw_using_check(amount)
      withdraw_to_cents = amount * 100

      if (@balance - withdraw_to_cents) < (@min_balance - 1000)
        puts "You cannot withdraw that much. Your current balance is #{@balance} cents"
      elsif @free_checks > 0
        @balance -= withdraw_to_cents
        @free_checks -= 1
        puts "Your account balance is now #{@balance} cents."
      else
        @balance -= (withdraw_to_cents + 200)
        puts "You already used up your free checks for this month, so you've been charged an extra $2."
        puts "Your new balance is #{@balance} cents."
      end
    end

    def reset_checks
      @free_checks = 3
    end


  end
end
