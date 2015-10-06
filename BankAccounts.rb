module Bank
  class Account
    attr_reader :balance
    def initialize(balance = 0)
      @id = rand(1000000)
      @balance = balance
      if balance < 0
        raise ArgumentError, "Not a valid initial balance!"
      end
    end
    def withdraw(amount)
      if amount > @balance
        puts "Not enough fundz!"
      else
        @balance = @balance - amount
      end
      return @balance
    end
    def deposit(amount)
      @balance = @balance + amount
    end
  end
end
