require 'pry'
module Bank


  class SavingsAccount < Account

    def initialize(id, initial_balance, open_date)
      super
      @min_balance = 10.0
      @fee = 2.0
      #Raises an argument error if the initial balance is less than 0
      if initial_balance.to_i/100.00 < @min_balance
        raise ArgumentError, "The balance cannot be less than $#{@min_balance}."
      end
    end

    # Rewrote the withdraw method in account so that only a super is needed - This line could come out but is being kept in for clarity.
    def withdraw(amount_to_withdraw)
      super
    end

    def add_interest(rate)
      interest =  @balance * rate/100
      @balance += interest
      return interest
    end


  end
end
