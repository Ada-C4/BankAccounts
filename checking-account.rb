module Bank
  class CheckingAccount < Account

    def initialize(id, initial_balance)
      super

      @checks = 0
    end

    def withdraw(withdrawal)
      if withdrawal < 0
        print "You cannot withdraw a negative amount. "

        return @balance
      end

      super(withdrawal + 100)
      @balance -= 100 if withdrawal + 100 <= @balance && withdrawal > 0

      return @balance
    end

    def withdraw_using_check(withdrawal)
      if withdrawal < 0
        print "You cannot withdraw a negative amount. "

        return @balance
      end

      if (@balance - withdrawal < -1000 && @checks <= 3) || (@balance - withdrawal - 200 < -1000 && @checks > 3)
        print "You cannot overdraft your account more than $10. "
      else
        @balance -= withdrawal
        @checks += 1
        @balance -= 200 if @checks > 3
      end

      return @balance
    end

    def reset_checks
      @checks = 0
    end

  end
end
