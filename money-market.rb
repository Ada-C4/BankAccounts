module Bank
  class MoneyMarketAccount < Account
    attr_reader :transactions_permitted, :transaction_count

    @@min_balance = 1000000

    def initialize(ident, open_date, balance)
      super
      @transaction_count = 0
      @transactions_permitted = true
    end


# If a withdrawal causes the balance to go below $10,000,
# a fee of $100 is imposed and no more transactions are allowed until the balance is increased using a deposit transaction.
# Each transaction will be counted against the maximum number of transactions

    def withdraw(withdraw_amount)
      if @balance - withdraw_amount < @@min_balance       # if balance will go below min balance
        @transactions_permitted = false                   # no more transactions
        @balance -= 10000                                 # fee of $100
      elsif
        @transaction_count < 6 && @transactions_permitted
        @transaction_count += 1
        @balance -= withdraw_amount
      else
        @balance
      end
    end

  # Updated deposit logic:
  # Each transaction will be counted against the maximum number of transactions
  # Exception to the above: A deposit performed to reach or exceed the minimum balance of $10,000 is not counted as part of the 6 transactions.


  end
end
