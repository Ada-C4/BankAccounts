module Bank
  class SavingsAccount < Account
    def initialize(id, balance, open_date)
      super(id, balance, open_date)
      @balance = balance
        if @balance < 1000
          raise ArgumentError, "Accounts cannot be opened with less than $10. Please try again."
        end
    end

    def withdraw(withdraw_amount)
      transaction_fee = 200
      super
      @balance = @balance - transaction_fee
      if @balance < 1000


      end
    end










  end







  class CheckingAccount < Account
  end
end
