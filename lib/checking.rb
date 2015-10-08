require './lib/account'

module Bank
  class CheckingAccount < Account
    MAX_CHECKS = 3
    FEE = 100
    def initialize(id, balance, open_date = "today", owner = nil)
      super(id, balance, open_date, owner)
      @type = "Checking"
      @fee = 100
      @num_checks = 0
    end

    def reset_checks
      puts "It's the dawn of a new month and your checks are back to 0!"
      @num_checks = 0
    end

  end
end
