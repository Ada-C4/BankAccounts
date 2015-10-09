module Bank
  class MoneyMarketAccount < Account
    attr_reader :num_transactions, :transaction_allowed
    def initialize(id, initial_balance, open_date, owner = nil)
      @id = id
      @balance = initial_balance
      @min_balance = 1000000
      @open_date = open_date
      @owner = owner
      @num_transactions = 0
      @max_transactions = 6
      @bal_above_min = true
      check_balance
    end

    def withdraw(amount)
      below_min_balance_fee = 10000
      if @num_transactions >= @max_transactions
        puts "You cannot make more than #{@max_transactions} transactions in one month. Transaction terminated."
      else #number of transactions is less than the alloted maximum
        if @bal_above_min
          if (@balance - amount < @min_balance) #withdrawing the amount will put the account below the minimum balance
            amount += below_min_balance_fee
            puts "Your account is locked until you reach the minimum balance of $#{@min_balance}."
            @bal_above_min = false
          end
            @balance -= amount
            @num_transactions += 1
          return @balance
        else #balance is below the minimum balance
          puts "You cannot make another transaction until your balance is increased to the minimum balance, $#{@min_balance}."
        end
      end
    end

    def deposit(amount)
      if !@bal_above_min
        if (amount + @balance >= @min_balance) #deposit
          super(amount)
          @bal_above_min = true
        else
          puts "You cannot make another transaction until your balance is increased to the minimum balance, $#{@min_balance}."
        end
      else #balance is above the minimum balance
        if @num_transactions >= @max_transactions
          puts "You cannot make more than #{@max_transactions} transactions in one month. Transaction terminated."
        else #number of transactions is less than the maximum allowed transactions
          super(amount)
          @num_transactions += 1
        end
      end
    end

    def reset_transactions
      @num_transactions = 0
    end

    def add_interest(rate)
      interest = @balance * (rate.to_f/100)
      balance += interest
      return interest
    end
  end
end
