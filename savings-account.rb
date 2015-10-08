require 'pry'
require "./bank-accounts.rb"

module Bank
  class SavingsAccount < Account

    def initialize(ident, open_date, balance)
      super
      min_balance = 1000
      raise ArgumentError.new("Your intial balance can't be less than #{min_balance}") if balance < min_balance
    end

    def withdraw(withdraw_amount)
      super(withdraw_amount + 1)
    end

  end

end
