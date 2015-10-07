
module Bank
  class Account
    attr_reader :account_id, :balance
    #allows account to be created with an initial balance as a parameter
    def initialize(balance)
      #creates ID#
      @account_id = generate_id
      @balance = balance
      #prevents initial balance from being a negative amount
      if balance < 0
        raise ArgumentError, "No negative balance allowed! Live within your means!"
      end
    end



    #method to create an ID number, not unique number yet
    def generate_id
      user_id = rand(0..101)
      return user_id
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

#still working on the Owner class
  class Owner
    attr_reader :name, :address, :account
    def initialize (owner_hash)
      @name = owner_hash [:name]
      @address = owner_hash[:address]
      @account = owner_hash [:account] || []
    end

    def add_account(account)
      @account.push(account)
    end

  end
end
