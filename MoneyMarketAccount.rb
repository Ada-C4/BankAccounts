module Bank
  class MoneyMarketAccount < Account
    def initialize(id, initial_balance, open_date, owner = nil)
      @id = id
      @balance = initial_balance
      @min_balance = 1000000
      @open_date = open_date
      @owner = owner
      @num_transactions = 0
      @max_transactions = 6
      @transaction_allowed = true
      check_balance
    end

    def withdraw(amount)
      below_min_balance_fee = 10000
      if @num_transactions >= @max_transactions
        puts "You cannot make more than #{@max_transactions} transactions in one month. Transaction terminated."
      else
        if @transaction_allowed
          if (@balance - amount < @min_balance)
            amount += below_min_balance_fee
            @transaction_allowed = false
          end
            @balance -= amount
            @num_transactions += 1
          return @balance
        else
          puts "You cannot make another transaction until your balance is increased to the minimum balance, $#{@min_balance}."
        end
      end
    end

#not working right now
    def deposit(amount)
      if
        true
      end
      @num_transactions += 1
    end
  end
end
