#balance should be a read only attr_reader so that
#user cannot change their balance

#we want to use raise ArgumentError.new("something about not opening an account with a negative balance")
module Bank
  class Account
    attr_reader :account_id, :balance

    def initialize(balance)
      #creates unique ID#
      @account_id = generate_id
      #supplies an initial balance on zero
      @balance = balance #need to figure out how to have neg balance check on this
      if balance < 0
        raise ArgumentError, "No negative balance allowed! Live within your means!"
        return @balance
      end
    end

  #  def neg_balance
  #    if @balance < 0
  #      raise ArgumentError "No negative balance allowed! Live within your means!"
  #      return @balance
  #    end
  #  end


    #method to create an ID
    def generate_id
      user_id = rand(0..101)
      return user_id
    end
      #supplies an initial balance
        #ArgumentError that will not allow negative balance
    #def new_balance()
    #  current_balance = 0
    #end
    #method for withdrawal
    def withdrawal(subtract_money)
      if (@balance - subtract_money) >= 0
        @balance = (@balance - subtract_money)
        return @balance
      else

        puts "Your withdrawal was rejected. You only have #{@balance} dollars."
        puts "You are not allowed to overdraft. Try a smaller withdrawal."
      #takes a single parameter
      #returns updated account balance
        #ArgumentError that will not allow negative balance
      end
    end

  #method for deposit
    def deposit(add_money)
      @balance = (@balance + add_money)
      #neg_balance
      return @balance
      #takes a single parameter
      #returns updated account balance
    end
  end
end
