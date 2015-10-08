module Bank
  class CheckingAccount < Account
    attr_reader :used_checks

    def initialize(ident, open_date, balance)
      super
      @used_checks = 0
    end

    def withdraw(withdraw_amount)
      super(withdraw_amount + 100)
    end

    def withdraw_using_check(amount)
      if @balance - amount < -1000
        puts "Insufficient new balance. Check denied."
        @balance
      else
        @used_checks += 1
        if @used_checks > 3
          @balance = @balance - amount - 200
        else
          @balance -= amount
        end
      end
    end

    def reset_checks
      @used_checks = 0
    end


  end

end
