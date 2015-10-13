require './lib/account'

module Bank
  class MoneyMarketAccount < SavingsAccount
    MAX_TRANSACTIONS = 6
    MIN_BALANCE = 1000000
    FEE = 10000
    def initialize(id, balance, open_date = "today", owner = nil)
      super(id, balance, open_date, owner)
      @type = "Money Market"
      @transactions = 0
    end

    def withdraw(amount)
      # Too many transactions
      if @transactions >= 6
        puts "You have already made #{@transactions} transactions this month. Sorry!"
      elsif @balance >= MIN_BALANCE
        @transactions += 1
        # if the withdrawal makes the balance go below the minimum balance
        if @balance - amount > MIN_BALANCE
          # Do the withdrawal without a penalty
          super(amount, false, false)
        else
          # Do the withdrawal with a penalty
          super(amount, false)
        end
      # If the balance is < $10,000 print error message
      else
        puts "You may not do any more withdrawals until your balance is above " + Money.new(MIN_BALANCE, "USD").format
      end
      return @balance
    end

    def reset_transactions
      puts "It's the dawn of a new month and your transactions are back to 0!"
      @transactions = 0
    end

    def deposit(amount)
      if @transactions < MAX_TRANSACTIONS || (@balance < MIN_BALANCE && @balance + amount >= MIN_BALANCE)
        below_balance = true if @balance < MIN_BALANCE
        # @transactions += 1 if @balance >= MIN_BALANCE
        super(amount)
        @transactions += 1 unless @balance >= MIN_BALANCE && below_balance
      else
        puts "You have already done #{@transactions} transactions this month. The limit is #{MAX_TRANSACTIONS} per month."
      end
      return @balance
    end

    def add_interest(rate)
      super(rate)
    end

  end
end
