module Bank
  class Account
    attr_reader :balance, :owner, :id
    def initialize(initial_balance, owner = nil)
      @balance = check_initial_balance(initial_balance)
      @id = rand(99999)
      @owner = owner
    end

    def check_initial_balance(initial_balance)
      if initial_balance < 0
        raise ArgumentError, "Invalid Balance: Can not add a negative balance."
      else
        return initial_balance
      end
    end

    def withdraw(withdraw_amount)
      if withdraw_amount > @balance
        puts "Warning: Can not withdraw more than is account. Transaction terminated."
        return @balance
      else
        @balance -= withdraw_amount
        return @balance
      end
    end

    def deposit(deposit_amount)
      @balance += deposit_amount
      return @balance
    end

    def add_owner(owner_name)
      @owner = owner_name
    end

  end

  class Owner
    attr_reader :id, :firstname, :lastname, :birthdate, :address
    def initialize(owner_hash)
      @id = rand(99999)
      @firstname = owner_hash[:firstname]
      @lastname = owner_hash[:lastname]
      @birthdate = owner_hash[:birthdate]
      @address = owner_hash[:address]
    end
  end

end




# a = Bank::Account.new(50000)
# chandler_hash = { firstname: "Chandler", lastname: "Bing", birthdate: "4/8/68", address: "NYC" }
# chandler = Bank::Owner.new(chandler_hash)
# joey = Bank::Owner.new({firstname: "Joey", lastname: "Tribbiani", birthdate: "1/9/68", address: "NYC" })
# a.add_owner(chandler)
