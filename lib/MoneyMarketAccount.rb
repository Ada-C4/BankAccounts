module Bank
  require "./account.rb"

  class MoneyMarketAccount < Account

    def initialize (id, date)
      super
      @num_transactions = 0
    end

    def initial_balance (1000000)
      super
    end

    def withdraw (amount, 100, 1000000)
      if check_transactions && check_balance
        super(amount, 100, 1000000)
        if show_balance < 1000000
          puts "You can't do more transactions until the balance is decrease to $10,000"
        end
        @num_transactions +=1
        else
        puts "You can't withdraw money. Think why"
      end
    end

      #check if the costumer want to depit monet to reach the minimum balance
    def reach_min_balance (amount)
      if (show_balance < 1000000) && (amount > (1000000 - show_balance))
        return true
      else
        return false
      end
    end



    def deposit (amount)
      if check_transactions && check_balance ## check that the num of trasactions are less then 7 & the balance more then 10,000$
        super
        @num_transactions += 1
      else
        if reach_min_balance(amount) #if he want to deposit money to reach $10,000 - don't count transactions
          super(amout)
      end
    end

    def check_transactions
      if @num_transactions < 7
        return true
      else
        return false
      end
    end

    def check_balance
      if show_balance < 1000000
        return false
      else
        return true
      end
    end






  end
end
