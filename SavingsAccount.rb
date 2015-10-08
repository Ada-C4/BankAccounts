require "./bank_accounts.rb"

class SavingsAccount < Account
    def initialize(id, initial_balance, open_date, owner = nil)
      if(initial_balance < 10)
        raise ArgumentError, "Your initial balance must be at least $10."
      end
      @balance = initial_balance
      @id = id
      @open_date = open_date
      @owner = owner
    end

end
