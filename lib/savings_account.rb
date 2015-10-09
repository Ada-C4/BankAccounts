module Bank
  class SavingsAccount < Account

    def initialize(id, initial_balance, open_date)
      super
      @min_balance = 10.0
      @fee = 2.0
      # Acct_type variable allows add_interest method from Account to function correctly for Savings Account
      @acct_type = "Savings"

      #Raises an argument error if the initial balance is less than 0
      if initial_balance.to_f < @min_balance
        raise ArgumentError, "The balance cannot be less than $#{@min_balance.round(2)}."
      end
    end

    # Savings Account uses the withdraw method from Account
    # This line could come out but is being kept in for clarity.
    def withdraw(orig_amount_to_withdraw)
      super
    end

    # Savings Account uses the add_interest method from Account
    # This line could come out but is being kept in for clarity.
    def add_interest(rate)
      super
    end


  end
end
