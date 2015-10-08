require './lib/account'

module Bank
  class CheckingAccount < Account
    MAX_CHECKS = 3
    FEE = 100
    def initialize
      @type = "Checking"
      # Create a minimum balance for this type of account
      @min_balance = 0
      @fee = 100
      @num_checks = 0
    end


  end


end
