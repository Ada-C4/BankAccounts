module Bank
  require "./account.rb"

  class MoneyMarketAccount < Account

    attr_accessor :num_transactions

    def initialize(id, date)
      super
      @num_transactions = 0
    end

    def initial_balance
      super(1000000)
    end

    def withdraw(amount)
      if check_transactions && check_min_balance
        puts "Your balance was $#{@balance/100}"
        @balance -= amount
        @num_transactions +=1
        puts "after you withdrew $#{amount/100}, your currecnt balance is $#{@balance/100}"
        if @balance < 1000000
          puts "You can't do more transactions until the balance will increase to $10,000"
          puts "and you've been charged with $100 fee"
          @balance -= 100
        end
      else
        if !check_transactions
          puts "Sorry you can't withdraw money since you've reached 6 transactions this month"
        else
          puts "you have $#{@balance/100} only in your account. Please deposit at least $#{1000000 - @balance}"
          puts "It won't count as one of youe monthly transactions"
        end
      end
    end

      #check if the costumer want to depit monet to reach the minimum balance
    def reach_min_balance(amount)
      if (@balance < 1000000) && (amount > (1000000 - @balance))
        return true
      else
        return false
      end
    end

    def add_interest(rate)
      super(rate)
    end

    def reset_transactions
      @num_transactions = 0
    end

    def deposit(amount)
      if check_transactions && check_min_balance ## check that the num of trasactions are less then 7 & the balance more then 10,000$
        super
        @num_transactions += 1
      elsif reach_min_balance(amount) #if he want to deposit money to reach $10,000 - don't count transactions
        super(amount)
      end
    end

    def check_transactions
      if @num_transactions < 7
        return true
      else
        return false
      end
    end

    def show_balance
      puts "Your current balance is $#{@balance/100}"
    end

    def check_min_balance
      if @balance < 1000000
        return false
      else
        return true
      end
    end


  end
end
