require 'pry'
require "./bank-accounts.rb"

module Bank
  class SavingsAccount < Account
    @@min_balance = 1000

    def withdraw(withdraw_amount)
      super(withdraw_amount + 2)
    end

  end
end
