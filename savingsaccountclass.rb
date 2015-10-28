# require "./bankaccounttest.rb"# require "./bankaccounttest.rb"
# require "./bankaccounttest.rb"
module Bank
  class SavingsAccount < Account
    # attr_accessor = :amount, :balance
    def initialize(id, balance)
      super
      # @balance = balance
      if @balance < 1000
        raise ArgumentError.new("An initial deposit of at least ten dollars (1000 cents) is required to open an account.")
      end
    end

    def savings_withdraw(withdraw)
      withdrawal_amount = withdraw + 200
      if @balance - withdrawal_amount <= 1000
        puts "The account minimum balance is $10 (1000 cents). You cannot go below that minimum."
        return @balance
      else
        @balance -= withdrawal_amount
      end
    end

    def add_interest(rate)
      account_interest = @balance * rate/100
      @balance += account_interest
      puts account_interest
      # print @balance
    end


  end
end
