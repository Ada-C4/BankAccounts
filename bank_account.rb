module Bank
  class Account
    attr_accessor :name, :initial_balance

    def initialize (name, initial_balance)
    @name = name
    @initial_balance= initial_balance
    puts "Welcome, #{name}.  You have #{initial_balance} in your account."
    end

    def new_account (initial_balance)
      if @initial_balance < 0
        raise ArgumentError.new ("You must start an account with more funds than $0")
      puts "Welcome, #{@name}.  Thank you for opening a new account."
      end
    end

    def withdrawal (withdrawal_amount)
      if withdrawal_amount > @balance
      puts "You have insufficient funds. You have #{@balance} in your account."
    elsif withdrawal_amount > 0
      @balance -= withdrawal_amount
      puts "You withdrew #{withdrawal_amount}.  Your new balance is #{@balance}."
      end
    end

    def deposit (deposit_amount)
      if deposit_amount > 0
        @balance += deposit_amount = new_balance
        puts "You deposited $#{deposit_amount}.  Your new balance is #{new_balance}."
      end
    end
  end
end
