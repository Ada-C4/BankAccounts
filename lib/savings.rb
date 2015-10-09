require './lib/account'

module Bank
  class SavingsAccount < Account
    FEE = 200
    MIN_BALANCE = 1000
    def initialize(id, balance, open_date = "today", owner = nil)
      super(id, balance, open_date, owner)
      @type = "Savings"
      if balance.to_i < MIN_BALANCE
        raise ArgumentError.new("You may not create an account below the minimum balance.")
      end
    end

    def add_interest(rate)
      puts "------ADD INTEREST------".colorize(:blue)
      interest = @balance * rate / 100
      puts "Starting balance: " + Money.new(@balance, "USD").format
      puts "You earned " + Money.new(interest, "USD").format + " at a rate of #{rate}%"
      @balance += interest
      puts "Updated balance: " + Money.new(@balance, "USD").format
      @balance.to_i
      return interest
    end

  end
end
