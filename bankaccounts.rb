module Bank
  class Account
    def initialize(initial_balance)
      @balance = check_initial_balance(initial_balance)
      @id = rand(99999)
    end

    def check_initial_balance(initial_balance)
      if initial_balance < 0
        raise ArgumentError, "Can not add a negative initial balance."
      else
        return initial_balance
      end
    end

    def withdraw(withdraw_amount)
      if @balance - withdraw_amount < 0
        puts "Warning: Can not withdraw more than is account."
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

    def check_balance
      puts @balance
    end
  end

end






#a = Bank::Account.new(50000)
