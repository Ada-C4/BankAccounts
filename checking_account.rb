module Bank
  class CheckingAccount < Account
    attr_reader :used_checks, :balance, :account_id, :owner_id

    MIN_BALANCE = 0
    WITHDRAWAL_FEE= 100

    def initialize(id, initial_balance, open_date)
      super
      @used_checks = 0
    end

    # The input amount gets taken out of the account as a result of a check withdrawal. Returns the updated account balance.
    # Allows the account to go into overdraft up to -$10 but not any lower
    # The user is allowed three free check uses in one month, but any subsequent use adds a $2 transaction fee
    #reset_checks: Resets the number of checks used to zero

    def withdraw_using_check(amount)
      if @used_checks >= 3
        @balance = @balance - 200
      end
      new_balance = @balance - amount
      raise ArgumentError.new("You don't have enough money for that.") if new_balance <= @balance - 1000
      @used_checks += 1
      @balance = new_balance
    end

    def reset_checks
      @used_checks = 0
    end

  end
end
