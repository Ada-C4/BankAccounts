module Bank
  class CheckingAccount < Account

    def withdraw(withdrawal)
      super
      @balance -= 100 if withdrawal <= @balance

      return @balance
    end

    def withdraw_using_check(amount)

    end

  end
end
