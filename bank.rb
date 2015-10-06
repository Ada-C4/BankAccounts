module Bank
  class Account

    attr_reader :balance

    def initialize(id, initial_balance)
      @id = id
      @balance = initial_balance
      # Raises an argument error if the initial balance is less than 0
      if initial_balance < 0
        raise ArgumentError, "The balance cannot be less than 0."
      end
    end

    def withdraw(amount_to_withdraw)
      if (@balance - amount_to_withdraw)< 0
        puts "The requested withdrawal is more than the available funds."
        puts "You only have $#{@balance} available for withdrawal."
        return @balance
      else
        @balance -= amount_to_withdraw
        puts "You have withdrawn $#{amount_to_withdraw}."
        puts "Your current balance is $#{@balance}"
        return @balance
      end
    end

    def deposit(amount_to_deposit)
      @balance += amount_to_deposit
      puts "You have deposited $#{amount_to_deposit}."
      puts "Your current balance is $#{@balance}."
      return @balance
    end

    def current_balance
      puts "The account with ID #{@id} currently has a balance of $#{@balance}."
    end
  end
end


# to create a new account: a = Bank::Account.new("ID", "INITIAL")
