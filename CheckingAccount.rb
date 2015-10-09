module Bank

  class CheckingAccount < Account

    def initialize(account_id, initial_balance, open_date, min_balance = 0, fee = 100)
      super
      @free_check = 3
    end

    def withdraw_using_check(amount)
      if @free_check > 0
        check_fee = 0
      else
        check_fee = 200
      end

      if (amount + check_fee) <= (@balance + 1000)
          @balance -= (amount + check_fee)
          @free_check -= 1
      else
        puts "Your account cannot overdraft by more than 1000. Your balance is #{@balance} so you cannot write a check for #{amount} at this time."
      end
      return @balance
    end

    def reset_checks
      @free_check = 3
    end



  end

end
