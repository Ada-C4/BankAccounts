module Bank
  class CheckingAccount < Account

    def initialize(id, initial_balance)
      super

      @checks = 0
    end

    def withdraw(withdrawal)
      super
      @balance -= 100 if withdrawal <= @balance

      return @balance
    end

    def withdraw_using_check(amount)
      if @balance - amount <= -1000
        print "You cannot overdraft your account more than $10."
      else
        @balance -= amount
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
