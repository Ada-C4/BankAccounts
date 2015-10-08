module Bank

  class CheckingAccount < Account

    def initialize(id, initial_balance, open_date)
      super
      @fee = 1.0
      @check_number = 1
      #@min_balance = 0
    end

    def withdraw(amount_to_withdraw)
      super
    end

    def withdraw_using_check(amount_to_withdraw)
      initial_balance = @balance
      if @check_number <= 3
        @fee = 0
        @min_balance = -10.0
        withdraw(amount_to_withdraw)
        @min_balance = 0
        if @balance != initial_balance
          @check_number +=1
        end
      else
        @fee = 2
        @min_balance = -10
        withdraw(amount_to_withdraw)
        if @balance != initial_balance
          @check_number +=1
        end
        @min_balance = 0
      end
      return @balance
    end

    def reset_checks
      @check_number = 0
    end

  end
end
