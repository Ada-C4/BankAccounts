module Bank
  class SavingsAccount < Account
    @@min_balance = 1000

    def withdraw(withdraw_amount)
      super(withdraw_amount + 200)
    end

    def add_interest(rate)
      interest = @balance * rate/100
      @balance += interest
      return interest
    end

  end
end
