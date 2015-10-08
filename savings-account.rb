module Bank
  class SavingsAccount < Account

    def initialize(id, initial_balance)
      @id = id.to_i
      @balance = initial_balance.to_i
      
      raise ArgumentError if @balance < 1000
    end

  end
end
