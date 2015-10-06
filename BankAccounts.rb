module Bank
  class Account
    attr_reader :balance
    def initialize(id, balance)
      @id = id
      @balance = balance
      raise ArgumentError.new("Permission Denied") if balance < 0
    end

    def withdrawl(amnt_withdrawn)
      if amnt_withdrawn > @balance
        puts "You can't take out more than #{@balance}"
      else
      @balance = @balance - amnt_withdrawn # Return the updated account balance.
      puts "Your current balance is: #{@balance}"
      end
    end

    def deposit(amnt_deposited)
      @balance = @balance + amnt_deposited #Return the updated account balance.
      puts "Your current balance is: #{@balance}"
    end
  end
end
