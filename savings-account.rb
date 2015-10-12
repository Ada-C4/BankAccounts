module Bank
  class SavingsAccount < Account

    FEE = 200
    MIN_BAL = 1000


    def initialize(id, initial_balance)
      super

      raise ArgumentError.new("Savings Accounts require a minimum initial balance of $1,000.") if @balance < 1000

      if self.class != MoneyMarketAccount
        puts "Thank you for opening a Savings Account with Daphne's Bank.".colorize(@colors_array[rand(0..@colors_array.length-1)])
        puts "___Account Summary___".colorize(@colors_array[rand(0..@colors_array.length-1)])
        puts "Account ID: #{@id}"
        puts "Initial balance: #{Money.new(@balance, "USD").format}\n\n"
        puts "Each withdrawal incurs a fee of $2 that is taken out of the balance. Account holders must maintain a minimum balance of $10, without  exception."
      end
    end

    def add_interest(rate)
      interest = @balance * rate/100
      @balance += interest
      puts "___Interest Receipt___".colorize(@colors_array[rand(0..@colors_array.length-1)])
      puts "Interest accrued: #{Money.new(interest, "USD").format}"
      puts "Your balance: #{Money.new(@balance, "USD").format}"

      return interest
    end

  end
end
