module Bank
  class SavingsAccount < Account

    def initialize(id, initial_balance)
      @id = id.to_i
      @balance = initial_balance.to_i

      raise ArgumentError if @balance < 1000
    end

    def withdraw(withdrawal)
      if @balance - withdrawal <= 1000
        puts "Your account balance cannot drop below $10."
      else
        super
        @balance -= 200
      end

      return @balance
    end
  end
end
