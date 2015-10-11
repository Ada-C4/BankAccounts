module Bank
  class MoneyMarketAccount < Account
    MAX_TRANSACTIONS = 6
    def initialize(id, initial_balance, open_date)
      super(id, initial_balance, open_date)
      @current_transactions = 0
      @transaction_ban = false
      @min_balance = 1000000
      if initial_balance.to_i < @min_balance
          raise ArgumentError, "Invalid Balance: Balance may not be less than $10,000.00"
      end
    end

    def withdraw(withdraw_amount)
      fee = 10000
      if @current_transactions >= MAX_TRANSACTIONS
        puts "You have already used up your maximum amount of transactions this month. Transaction terminated."
      elsif @transaction_ban == true
        puts "Transaction denied. Balance must be increased with a deposit before further transactions."
      elsif (@balance - withdraw_amount) < @min_balance
        puts "A $100.00 fee will be incurred for balance going below $10,000.00."
        puts "No more transactions allowed until the balance is increased."
        @transaction_ban = true
        @balance -= (withdraw_amount + fee)
        @current_transactions += 1
      else
        @balance -= withdraw_amount
        @current_transactions += 1
      end
      return @balance
    end

    def reset_transactions
      @current_transactions = 0
    end


  end
end
