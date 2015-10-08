module Bank
  class Account
    attr_reader :account_id, :balance, :time
    #allows account to be created with an initial balance as a parameter
    def initialize(balance)
      #creates ID#
      @account_id = generate_id
      @balance = balance_restriction(balance)
      @time = account_opened


      #prevents initial balance from being a negative amount
      #if balance < 0
      #  raise Exception.new, "No negative balance allowed! Live within your means!"
      #end
    end

  #method to create an ID number, not unique number yet

    def balance_restriction (balance)
      if balance < 0
        raise Exception.new("No negative balance allowed! Live within your means!")
      else
        return balance
      end
    end
    
    def generate_id
      user_id = rand(1000..9000)
      return user_id
    end

    def account_opened
      time = Time.new
      return time
    end

    #method for withdrawal
    def withdrawal(subtract_money)
      if (@balance - subtract_money) >= 0
        @balance = (@balance - subtract_money)
        #returns updated account balance
        return @balance
      else
      #rejects negative balance, and returns current balance
        puts "Your withdrawal was rejected. You only have #{@balance} dollars."
        puts "You are not allowed to overdraft. Try a smaller withdrawal."
      end
    end

  #method for deposit
    def deposit(add_money)
      @balance = (@balance + add_money)
      #returns updated account balance
      return @balance
    end
  end
end
