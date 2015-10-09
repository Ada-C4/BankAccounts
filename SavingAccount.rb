module Bank

  class SavingAccount < Account
    attr_reader :balance
    # set my deafualt balance to 100
    def initialize(id, balance, opendate)
      super
      @withdraw_fee = 2
        if balance < 10
          raise ArgumentError, "You need more money!"
        end
    end

    def withdraw(amount)
      if @balance - amount - @withdraw_fee < 10
        puts "Warning, you are about to withdraw your account!"
        return @balance
      else
        super
      end
    end

    def add_interest(rate)
      p = @balance * rate/100
      @balance = p + @balance
      return p
    end

  end
end
