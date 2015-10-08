require './lib/account'

module Bank
  class MoneyMarketAccount < Account
    MAX_TRANSACTIONS = 6
    MIN_INITIAL_BALANCE = 1000000
    FEE = 10000
    def initialize(id, balance, open_date = "today", owner = nil)
      super(id, balance, open_date, owner)
      if balance.to_i < MIN_INITIAL_BALANCE
        raise ArgumentError.new("You may not create an account below the minimum balance.")
      end
      @type = "Money Market"
      @transactions = 0
    end

    def withdraw(amount)
      puts "----MMA WITHDRAWAL----".colorize(:blue)
      # Too many transactions
      if @transactions >= 6
        puts "You have already made #{@transactions} transactions this month. Sorry!"
      # Do the transaction if the funds are above $10,000
      elsif @balance - amount < 0
        puts "You do not have sufficient funds to withdraw that amount."
      elsif @balance >= MIN_INITIAL_BALANCE
        @transactions += 1
        puts "Starting balance: " + Money.new(@balance, "USD").format
        puts "Amount withdrawn: " + Money.new(amount, "USD").format
        if @balance - amount < MIN_INITIAL_BALANCE
          puts "Penalty: " + Money.new(FEE, "USD").format
          amount += FEE
        end
        @balance -= amount
        puts "Updated balance: " + Money.new(@balance, "USD").format
      # Print error message for not having enough funds to withdraw
      else
        puts "You may not do any more withdrawals until your balance is above " + Money.new(MIN_INITIAL_BALANCE, "USD").format
      end
      return @balance
    end

    def reset_transactions
      puts "It's the dawn of a new month and your transactions are back to 0!"
      @transactions = 0
    end

  end
end
