
require "pry"

module Bank

  # Create a `MoneyMarketAccount` class which should inherit behavior from the `Account` class.
  class MoneyMarketAccount < Account

  # - The initial balance cannot be less than $10,000 - this will `raise` an `ArgumentError`
  # - A maximum of 6 transactions (deposits or withdrawals) are allowed per month on this account type
      def initialize
        super(10_000_00)
        @transactions_used = 0
      end

# - Updated withdrawal logic:
      def withdraw(withdraw_amount)
        min_balance = (checking_min_balance + fee)
        #   - If a withdrawal causes the balance to go below $10,000, a fee of $100 is imposed and no more transactions are allowed until the balance is increased using a deposit transaction.
        #   - Each transaction will be counted against the maximum number of transactions
        if @transactions_used < 6
          @balance = super(withdraw_amount)
            if @balance < 10_000_00
              @balance -= 100_00
              @transactions_used = 6
            else
              @transactions_used += 1
            end
        else
          puts "You have reached your transaction limit of 6 for this month. Please contact your banker if you have any questions."
        end
      end #of withdraw method

# - Updated deposit logic:
      def deposit(deposit_amount)
#   - Exception to the below: A deposit performed to reach or exceed the minimum balance of $10,000 is not counted as part of the 6 transactions.
        if (@balance < 10_000_00) && ((@balance + deposit_amount) >= 10_000_00)
          super(deposit_amount)
        elsif (@balance < 10_000_00) && ((@balance + deposit_amount) <= 10_000_00)
          puts "Your balance is less that that minium requirement of 10,000.00"
          puts "Please deposit a minium of #{10_000_00 - @balance} to gain access to your account again."
#   - Each transaction will be counted against the maximum number of transactions
        elsif @transactions_used < 6
          super(deposit_amount, fee = 0)
          @transactions_used += 1
        else
          puts "You have reached your transaction limit of 6 for this month. Please contact your banker if you have any questions."
        end
      end

      def add_interest(rate)
# - `#add_interest(rate)`: Calculate the interest on the balance and add the interest to the balance. Return the interest that was calculated and added to the balance (not the updated balance).
#     - Note** This is the same as the `SavingsAccount` interest.
        interest = (@balance * (rate/100))
        @balance += interest.to_i
        return interest.to_i
      end

# - `#reset_transactions`: Resets the number of transactions to zero
      def reset_transactions
        @transactions_used = 0
      end

  end

end
