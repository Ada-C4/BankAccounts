
module Bank

  class SavingsAccount < Account
  attr_reader :balance, :owner, :account_id, :owner_id

  MIN_BALANCE = 1000
  WITHDRAWAL_FEE = 200

    def add_interest(rate)
      if rate < 0
        puts "Please select a positive interest rate."
      else
        @interest = @balance * rate/100
        @balance += @interest
        return @interest
      end
    end

  end

end
