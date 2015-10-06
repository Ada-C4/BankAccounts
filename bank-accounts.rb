# run this file with
# irb -r "./bank-accounts.rb"

module Bank

  class Account
    attr_reader :balance

    def initialize(ident, balance = 0)  # optional parameter
      @ident = ident
      @balance = balance
      raise ArgumentError.new("Your intial balance can't be negative") if balance < 0
    end

    def withdraw(withdraw_amount)
      if @balance - withdraw_amount < 0
        puts "Insufficient funds. Withdraw denied."
        @balance
      else
        @balance -= withdraw_amount
      end
    end

    def deposit(deposit_amount)
      @balance += deposit_amount
    end
  end

end
