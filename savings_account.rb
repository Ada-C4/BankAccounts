require "./bank.rb"

module Bank

  class SavingsAccount < Account
  attr_reader :balance, :owner, :account_id, :owner_id

    def initialize(id, initial_balance, open_date)
      super
      raise ArgumentError.new("You must have at least $10 to start a savings account.") if initial_balance < 1000
      @min_balance = 1000
      @withdrawal_fee = 200
    end

    def add_interest(rate)
      @interest = @balance * rate/100
      @balance += @interest
      return @interest
    end

  end

end
