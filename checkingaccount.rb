module Bank

  class CheckingAccount < Account
    def initialize(id, balance, open_date)
      super

      @act_withdraw_fee = 100
    end

    def withdraw(withdraw_amt)
      super
    end

    def withdraw_using_check(amount)
      withdraw_to_cents = amount * 100

      free_checks = 3

      if (@balance - withdraw_to_cents) < (@min_balance + 1000)
        puts "You cannot withdraw that much. Your current balance is #{@balance} cents"
      elsif free_checks > 0
        @balance -= (withdraw_to_cents)
        puts "Your account balance is now #{@balance} cents."
        free_checks -= 1
      else

      end

    end


  end
end
