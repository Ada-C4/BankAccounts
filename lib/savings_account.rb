require 'pry'
module Bank


  class SavingsAccount < Account

    def initialize(id, initial_balance, open_date)
      super
      @min_balance = 10.0
      @fee = 2.0
      @acct_type = "Savings"

      #Raises an argument error if the initial balance is less than 0
      if initial_balance.to_f < @min_balance
        raise ArgumentError, "The balance cannot be less than $#{@min_balance}."
      end
    end

    # Rewrote the withdraw method in account so that only a super is needed - This line could come out but is being kept in for clarity.
    def withdraw(orig_amount_to_withdraw)
      super
    end

    def add_interest(rate)
      super
    end


  end
end
