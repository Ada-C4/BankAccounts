module Bank

  class Account
    attr_reader :balance, :owner, :account_id, :owner_id

    def initialize (id, initial_balance)
      @account_id = id
      raise ArgumentError.new("You can't start an account with a negative balance.") if initial_balance <= 0
      @balance = initial_balance
      # Initial balance cannot be negative, raises an Argument Errors
    end

    # Withdraw money
    # Make sure account doesn't fall into the negative because of withdrawal

    # Pass in an account owner from an already created Owner instance
    def add_owner(owner)
      @owner = owner
    end

    def withdraw(amount)
      new_balance = @balance - amount
      if amount < 0
        puts "You can't withdraw a negative amount."
      elsif new_balance < 0
        puts "You don't have that much money. You can withdraw up to #{@balance} dollars."
      else
        @balance = new_balance
        return @balance
      end
    end


    # Deposit money, making sure you aren't depositing a negative amount
    #Return updated balance
    def deposit(amount)
      if amount < 0
        puts "You can't deposit a negative amount."
      else
        @balance += amount
        return @balance
      end
    end

  end

  class Owner
    attr_reader :first_name, :last_name, :street_address, :city, :state

    def initialize(owner_id, owner_hash)
      @owner_id = owner_id
      @account_id_1 = owner_hash[:account_id]
      @first_name = owner_hash[:first_name]
      @last_name = owner_hash[:last_name]
      @street_address = owner_hash[:street_address]
      @city = owner_hash[:city]
      @state = owner_hash[:state]
    end

  end

end
