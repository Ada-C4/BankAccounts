module Bank

  class CheckingAccount < Account

    def initialize(id, initial_balance, open_date)
      super
      @fee = 1
      @check_number = 1
      #@min_balance = 0
    end

    def withdraw(amount_to_withdraw)
      super
    end

    def withdraw_using_check(amount_to_withdraw)
      if check_number <= 3
        @min_balance = -10
        withdraw(amount_to_withdraw)
        @min_balance = 0
        @check_number +=1
      else
        @fee = 2
        @min_balance = -10
        withdraw(amount_to_withdraw)
        @min_balance = 0
      end

    end

  end
end
