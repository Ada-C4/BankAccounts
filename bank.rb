module Bank

  class Account
    attr_reader :balance, :owner, :id

    def initialize (id, initial_balance)
      @id = id
      raise ArgumentError.new("You can't start an account with a negative balance. Try again with some actual money, buddy. How much you got?") if initial_balance <= 0
      @balance = initial_balance
      # Initial balance cannot be negative, raises an Argument Errors
    end

    # Withdraw money
    # Make sure account doesn't fall into the negative because of withdrawal 
    def withdraw(amount)
      new_balance = @balance - amount
      if amount < 0
        puts "You can't withdraw a negative amount. Try depositing, ya dope."
      elsif new_balance < 0
        puts "Woah there, you don't have that much money hot stuff. You can withdraw up to #{@balance} dollars. Try again, within your means."
      else
        @balance = new_balance
        return @balance
      end
    end


    # Deposit money, making sure you aren't depositing a negative amount
    #Return updated balance
    def deposit(amount)
      if amount < 0
        puts "You can't deposit a negative amount, sillyhead. Try putting in some real money next time."
      else
        @balance += amount
        return @balance
      end
    end

  end

  class Owner
    attr_reader :name

    def initialize(owner_hash)
      @name = name
      @street_address =
    end

  end

end
