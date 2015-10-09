module Bank

class CheckingAccount < Account

    attr_reader :balance
    # set my deafualt balance to 100
    def initialize(id, balance, opendate)
        super
        @withdraw_fee = 1
        @checks_wdrawn = 0
    end

    def withdraw_using_check(amount)
      if @checks_wdrawn > 3
        @balance -= 2
      end
      if @balance - amount < -10
        puts "warning"
      else
        @balance -= amount
      end
      @checks_wdrawn += 1
      return @balance
    end
end
end
