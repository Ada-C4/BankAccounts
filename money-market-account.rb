module Bank
  class MoneyMarketAccount < SavingsAccount

    attr_reader :transactions

    FEE = 10000

    def initialize(id, initial_balance)
      super

      @transactions = 0
      @lock = false
      raise ArgumentError.new("Money Market Accounts require a minimum initial balance of $10,000.") if @balance < 1000000

      puts "Thank you for opening a Money Market Account with Daphne's Bank.".colorize(@colors_array[rand(0..@colors_array.length-1)])
      puts "___Account Summary___".colorize(@colors_array[rand(0..@colors_array.length-1)])
      puts "Account ID: #{@id}"
      puts "Initial balance: #{Money.new(@balance, "USD").format}\n\n"
      puts "A maximum of 6 transactions (deposits or withdrawals) are allowed per month. If a withdrawal causes the balance to go below $10,000, a fee of $100 is imposed and no more transactions are allowed until the balance is increased using a deposit transaction. A deposit performed to reach or exceed the minimum balance of $10,000 is not counted as part of the 6 transactions."
    end

    def withdraw(withdrawal)
      if @transactions < 6 && @lock == false
        @transactions += 1 if withdrawal + 10000 <= @balance && withdrawal > 0

        super
        if @balance < 1000000
          @balance -= 10000
          @lock = true
          puts "Fees: #{Money.new(self.class::FEE, "USD").format}"
        end
        puts "Your balance: #{Money.new(@balance, "USD").format}" if withdrawal > 0
        puts "Transactions this period: #{@transactions}"
      else
        print "Your account is locked until your balance is restored to $10,000. " if @lock
        print "You have reached your maximum of 6 transactions this month. " if @lock == false
      end

      return @balance
    end

    def deposit(deposit_amt)
      @lock = false if deposit_amt + @balance > 1000000

      if @transactions < 6 && @lock == false
        @transactions += 1 if @balance >= 1000000 && deposit_amt > 0
        super
        puts "Transactions this period: #{@transactions}"
      else
        print "Your account is locked until your balance is restored to $10,000. " if @lock
        print "You have reached your maximum of 6 transactions this month. " if @lock == false
      end

      return @balance
    end

    def reset_transactions
      @transactions = 0
    end

  end
end
