require './lib/account'

module Bank
  class CheckingAccount < Account
    MAX_CHECKS = 3
    FEE = 100
    OVERDRAFT = -1000
    def initialize(id, balance, open_date = "today", owner = nil)
      super(id, balance, open_date, owner)
      @type = "Checking"
      @fee = 100
      @num_checks = 0
    end

    def withdraw_using_check(amount)
      if amount < 0
        puts "You cannot withdraw a negative amount of money."
      else
        puts "---CHECK WITHDRAWAL---".colorize(:blue)
        # This is a shorthand if-else statement
        @num_checks > 2 ? (penalty = 200) : (penalty = 0)
        if @balance - amount - penalty >= OVERDRAFT
          puts "Starting balance: " + Money.new(@balance, "USD").format
          puts "Amount withdrawn: " + Money.new(amount, "USD").format
          puts "Too Many Checks Penalty: " + Money.new(penalty, "USD").format
          @balance -= (amount + penalty)
          puts "Updated balance: " + Money.new(@balance, "USD").format
          @num_checks += 1
        else
          puts "You cannot go below the minimum overdraft balance of " + Money.new(OVERDRAFT, "USD").format
        end
      end
      return @balance
    end

    def reset_checks
      puts "It's the dawn of a new month and your checks are back to 0!"
      @num_checks = 0
    end

  end
end
