module Bank
  require 'pry'
  require 'csv'
  class SavingsAccount < Account

    #change initialize class for the purpose of modifying withdrawal behavior
    def initialize (account_id, balance, open_date, owner = nil)
      super(account_id, balance, open_date, owner = nil)
      @withdrawalfee = 200
    end

    # The initial balance cannot be less than $10. If it is, this will raise an ArgumentError
    def confirm_initial_balance
      if @balance < 1000
        raise ArgumentError.new("Balance must be integer value 1000 or greater.")
      end
    end

    def withdraw(withdrawal_amount, withdrawalcap = (@balance - 1000))
      super(withdrawal_amount, withdrawalcap)
    end

    def add_interest(rate)
    interest = @balance * rate/100
    @balance = @balance + interest
    puts @balance.to_i.to_s
    puts interest.to_i.to_s
    return interest.to_i
    end
  end
end
