module Bank
  class SavingsAccount < Account
    def initialize(id, balance, open_date)
      super(id, balance, open_date)
        if @balance < 1000
          raise ArgumentError, "Accounts cannot be opened with less than $10. Please try again."
        end
    end

    def withdraw(withdraw_amount)
      transaction_fee = 200
      @balance = @balance.to_i - transaction_fee.to_i - withdraw_amount.to_i
      if @balance < 1000
        puts "You cannot have less than $10. This withdraw has been cancelled."
        @balance = @balance + withdraw_amount.to_i + transaction_fee
      end
      return @balance
    end

    def add_interest(rate)
      interest_rate = rate
      added_rate = @balance * (interest_rate/100)
      @balance = @balance + added_rate
      return added_rate
    end










  end







  class CheckingAccount < Account
  end
end
