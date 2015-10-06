module Bank
  class Account
    attr_reader :balance
    def initialize(balance)
      @balance = balance
      raise ArgumentError.new("Permission Denied") if balance < 0
    end

    def withdrawl(amnt_withdrawn)
      # Return the updated account balance.
      # Raise a warning message if user tries to withdrawl more than they have.
    end

    def deposit(amnt_deposited)
      #  Return the updated account balance.
    end

  end
end
