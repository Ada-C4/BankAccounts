module Bank
  attr_reader :balance
  class Account
    def initialize
      @id = id
      @balance = balance
      new_account_balance
    end
    def new_account_balance
      #if initial balance is negative, raise an ArgumentError
    end
    def withdraw(amount)
      #withdraw amount from balance
      #if withdraw amount is greater than balance, output warning message and return unmodified balance
      #return updated balance
    end
    def deposit(amount)
      #deposit amount to balance
      #return updated balance
    end
  end
end
