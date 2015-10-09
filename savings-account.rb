module Bank
  class SavingsAccount < Account

    def initialize(id, initial_balance)
      super

      raise ArgumentError if @balance < 1000
    end

    def withdraw(withdrawal)
      if withdrawal < 0
        print "You cannot withdraw a negative amount. "

        return @balance
      end
      
      if @balance - withdrawal - 200 >= 1000
        super
        @balance -= 200 if withdrawal > 0
      else
        print "Your account balance cannot drop below $10. "
      end

      return @balance
    end

    def add_interest(rate)
      interest = @balance * rate/100
      @balance += interest

      return interest
    end

  end
end
