module Bank
  class Account
    attr_accessor :name, :balance, :check_count
    def initialize (name, initial_balance)
      @name = name
      @balance= initial_balance

      if @balance < 0
        raise ArgumentError.new ("You must start an account with more funds than $0")
      else
        puts "Welcome, #{@name}.  Thank you for opening a new account. Your balance is $#{@balance}"
      end
    end

    def withdraw (withdrawal_amount)
      if withdrawal_amount > @balance
        puts "You have insufficient funds. You have $#{@balance} in your account."
      elsif withdrawal_amount > 0
        @balance = @balance - withdrawal_amount
        puts "You withdrew $#{withdrawal_amount}. Your new balance is #{@balance}. SUCKA"
      end
      return @balance
    end

    def balance
      return @balance
    end

    def deposit (deposit_amount)
      if deposit_amount > 0
        @balance = @balance + deposit_amount
        puts "You deposited $#{deposit_amount}.  Your new balance is #{@balance}."
      end
      return @balance
    end
  end
end
