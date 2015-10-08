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

    def add_interest(rate)
      puts "------ADD INTEREST------".colorize(:blue)
      interest = @balance * rate.to_f / 100
      puts "Starting balance: " + Money.new(@balance, "USD").format
      puts "You earned " + Money.new(interest, "USD").format + " at a rate of #{rate}%"
      @balance += interest
      puts "Updated balance: " + Money.new(@balance, "USD").format
      puts "Actual balance is #{@balance}"
      return interest
    end

  end
end
