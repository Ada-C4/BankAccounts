module Bank
  class Account
    attr_reader :id, :balance, :owner
    def initialize(id, initial_balance, owner = nil)
      if(initial_balance < 0)
        raise ArgumentError, "Your initial balance must be a positive value."
      end
      @balance = initial_balance
      @id = id
      @owner = owner
    end

    def add_owner(owner)
      @owner = owner
    end

    def withdraw(amount)
      if (@balance < amount)
        puts "This will result in a negative account balance. Transaction terminated."
      else
        @balance -= amount
      end
      return @balance
    end

    def deposit(amount)
      @balance += amount
      return @balance
    end
  end

  class Owner
    attr_reader :name, :street, :city, :state, :zip
    def initialize(info_hash)
      @id = info_hash[:id]
      @name = info_hash[:name]
      @street = info_hash[:street]
      @city = info_hash[:city]
      @state = info_hash[:state]
      @zip = info_hash[:zip]
    end
  end
end
