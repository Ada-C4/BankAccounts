require './lib/account'

module Bank
  class SavingsAccount < Account
    def initialize(id, balance, open_date = "today", owner = nil)
      super(id, balance, open_date, owner)
      @min_balance = 1000
      @type = "Savings"
      @fee = 200
      if balance.to_i < @min_balance
        raise ArgumentError.new("You may not create an account below the minimum balance.")
      end
    end


    # def withdraw(amount)
    #   fee = 200
    #   if @balance - (amount + fee) < 1000
    #     puts "You cannot go below the minimum balance of $10.00. Transaction cancelled."
    #   else
    #     return @balance -= (amount + fee)
    #   end
    # end


  end
end
